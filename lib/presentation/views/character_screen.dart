

import 'package:breakbad/business_logic/cubit/characters_cubit.dart';
import 'package:breakbad/business_logic/cubit/characters_state.dart';
import 'package:breakbad/data/models/character.dart';
import 'package:breakbad/presentation/widget/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Results> allCharacters;
  late List<Results> searchedForCharacters;
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  Widget buildSearchfield() {
    return TextField(
      controller: searchController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: "Find a Character.....",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
      ),
      style: TextStyle(color: Colors.grey),
      onChanged: (searchedCharacter) {
        addSearchForItemToItemList(searchedCharacter);
      },
    );
  }

  void addSearchForItemToItemList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
        return null;
  }

  List <Widget> buildAppBarActions(){
    if(isSearching){
      return[
       IconButton(onPressed: (){
        clearSearch();
        Navigator.pop(context);
       }, icon:Icon(Icons.clear) )
       
       ];
    }else{
      return [
        IconButton(onPressed:startSearch, icon: Icon(Icons.search))
      ];

    }
  }
  void startSearch() {
  ModalRoute.of(context)?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
  setState(() {
    isSearching = true;
  });
}

  void stopSearching(){
    clearSearch();
    setState(() {
      isSearching=false;
    });
  }

  void clearSearch(){
    setState(() {
      searchController.clear();
    });
  }

  Widget buildblockwidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
      if (state is CharacterLoaded) {
        allCharacters = (state).characters;
        return buildLoadedListWidget();
      } else {
        return showloadingIndicator();
      }
    });
  }

  Widget showloadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [buildChractersList()],
        ),
      ),
    );
  }

  Widget buildChractersList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 1,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            crossAxisCount: 2),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        itemCount:searchController.text.isEmpty? allCharacters.length:searchedForCharacters.length,
        itemBuilder: (ctx, index) {
          return CharacterItem(
            character: allCharacters[index],
          );
        });
  }
  
  Widget appbartitle(){
    return Text("characters",style: TextStyle(color: Colors.black),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: isSearching?buildSearchfield():appbartitle(),
        actions:   buildAppBarActions(),
        
        backgroundColor: Colors.yellowAccent,
      ),
      body: buildblockwidget(),
    );
  }
}
