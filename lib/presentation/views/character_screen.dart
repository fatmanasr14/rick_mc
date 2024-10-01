import 'package:breakbad/business_logic/cubit/characters_cubit.dart';
import 'package:breakbad/business_logic/cubit/characters_state.dart';
import 'package:breakbad/data/models/character.dart';
import 'package:breakbad/presentation/widget/character_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Results> allCharacters;
  
  @override
void initState() {
  super.initState();
  BlocProvider.of<CharacterCubit>(context).getAllCharacters();
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

  Widget showloadingIndicator(){
    return Center(
      child: CircularProgressIndicator(

      ),
    );
  }
  Widget buildLoadedListWidget(){
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            buildChractersList()
          ],
        ),
      ),

    );
  }

  Widget buildChractersList(){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 1,
        childAspectRatio: 2/3,
        crossAxisSpacing: 1,
        crossAxisCount: 2),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        itemCount: allCharacters.length,

         itemBuilder: (ctx,index){
          return CharacterItem(character: allCharacters[index],);
         });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Characters'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: buildblockwidget(),
    );
  }
}
