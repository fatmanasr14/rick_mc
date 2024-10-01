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

    allCharacters = BlocProvider.of<CharacterCubit>(context).getAllCharacters()
        as List<Results>;
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
      appBar: AppBar(
        title: const Text('Characters'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: buildblockwidget(),
      // body:
      // BlocBuilder<CharacterCubit, CharacterState>(
      //   builder: (context, state) {
      //     if (state is CharacterLoading) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (state is CharacterLoaded) {
      //       final allCharacters = state.characters;
      //       return ListView.builder(
      //         itemCount: allCharacters.length,
      //         itemBuilder: (context, index) {
      //           return Card(
      //             elevation: 4,
      //             margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      //             child: ListTile(
      //               leading: CircleAvatar(
      //                 backgroundImage: NetworkImage(allCharacters[index].image ?? ''), // تأكد من وجود الصورة
      //               ),
      //               title: Text(
      //                 allCharacters[index].name ?? 'Unknown',
      //                 style: const TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 18,
      //                 ),
      //               ),
      //               subtitle: Text(
      //                 allCharacters[index].status ?? 'No status',
      //                 style: const TextStyle(color: Colors.grey),
      //               ),
      //               trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      //               onTap: () {
      //                 Navigator.pushNamed(context, '/characterDetail', arguments: allCharacters[index]);
      //               },
      //             ),
      //           );
      //         },
      //       );
      //     } else if (state is CharacterError) {
      //       return Center(child: Text('Error: ${state.message}'));
      //     } else {
      //       return const Center(child: Text('No characters found!'));
      //     }
      //   },
      // ),
    );
  }
}
