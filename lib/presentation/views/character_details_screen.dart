import 'package:flutter/material.dart';
import 'package:breakbad/data/models/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Results character;

  const CharacterDetailsScreen({Key? key, required this.character}) : super(key: key);
  Widget buildSilverAppbar(){
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name!,
          style: TextStyle(color: Colors.white),
          


        ),
        background: Hero(tag: character.id!, 
        child: Image.network(character.image!,fit: BoxFit.cover,)),
      ),
      

    ); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          buildSilverAppbar(),
          SliverList(delegate: SliverChildListDelegate([

          ]),),
        ]
      ),
      // appBar: AppBar(
      //   title: Text(character.name!),
      //   backgroundColor: Colors.yellowAccent,
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Hero(
      //         tag: character.image!,
      //         child: Image.network(
      //           character.image!,
      //           height: 300,
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //       SizedBox(height: 16),
      //       Text(
      //         character.name!,
      //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //       ),
      //       SizedBox(height: 8),
      //       Text(
      //         'Status: ${character.status}',
      //         style: TextStyle(fontSize: 18),
      //       ),
      //       SizedBox(height: 8),
      //       Text(
      //         'Species: ${character.species}',
      //         style: TextStyle(fontSize: 18),
      //       ),
      //       SizedBox(height: 8),
      //       Text(
      //         'Gender: ${character.gender}',
      //         style: TextStyle(fontSize: 18),
      //       ),
      //       SizedBox(height: 8),
      //       Text(
      //         'Origin: ${character.origin?.name ?? 'Unknown'}',
      //         style: TextStyle(fontSize: 18),
      //       ),
      //       SizedBox(height: 8),
      //       Text(
      //         'Location: ${character.location?.name ?? 'Unknown'}',
      //         style: TextStyle(fontSize: 18),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
