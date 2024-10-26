import 'package:breakbad/business_logic/cubit/characters_cubit.dart';
import 'package:breakbad/business_logic/cubit/characters_state.dart';
import 'package:breakbad/data/models/character.dart';
import 'package:breakbad/presentation/views/character_details_screen.dart';
import 'package:breakbad/presentation/widget/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Results> allCharacters;
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  void navigateToCharacterDetailsScreen(BuildContext context, Results character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetailsScreen(character: character),
      ),
    );
  }

  Widget buildSearchfield() {
    return TextField(
      controller: searchController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: "Find a Character...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
      ),
      style: TextStyle(color: Colors.grey),
      onChanged: (searchedCharacter) {
        BlocProvider.of<CharacterCubit>(context).searchCharacters(searchedCharacter);
      },
    );
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
          },
          icon: Icon(Icons.clear),
        ),
      ];
    } else {
      return [IconButton(onPressed: startSearch, icon: Icon(Icons.search))];
    }
  }

  void startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchController.clear();
    });
    BlocProvider.of<CharacterCubit>(context).searchCharacters(''); // Show all characters again
  }

  Widget buildblockwidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          allCharacters = state.characters;
          return buildLoadedListWidget();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [buildCharactersList()],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 1,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          crossAxisCount: 2),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: ClampingScrollPhysics(),
      itemCount: allCharacters.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            navigateToCharacterDetailsScreen(context, allCharacters[index]);
          },
          
          child: CharacterItem(
            character: allCharacters[index],
          ),
        );
      },
    );
  }

  Widget appBarTitle() {
    return Text(
      "Characters",
      style: TextStyle(
        fontSize: 25,
        color: Color.fromARGB(255, 15, 15, 15)),
    );
  }

  Widget buildNoInternetWidget(){
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: isSearching ? buildSearchfield() : appBarTitle(),
        actions: buildAppBarActions(),
        backgroundColor: Color.fromARGB(255, 230, 215, 189),
      ),
      body: 
      // OfflineBuilder(
      //   connectivityBuilder: (
      //     BuildContext context,
      //     List<ConnectivityResult> connectivity,
      //     Widget child,
      //   ){
      //     final bool connected = !connectivity.contains(ConnectivityResult.none);
      //     if(connected){
      //       return buildblockwidget();

      //     }else{
      //       return buildNoInternetWidget();

      //     }
      //   })
      
      buildblockwidget(),
    );
  }
}
