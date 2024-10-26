import 'package:flutter/material.dart';
import 'package:breakbad/data/models/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Results character;

  const CharacterDetailsScreen({Key? key, required this.character}) : super(key: key);
  Widget buildSilverAppbar(){
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        // title: Text(
        //   character.name!,
        //   style: TextStyle(color: Colors.white),
          


        // ),
        background: Hero(tag: character.id!, 
        child: Image.network(character.image!,fit: BoxFit.cover,)),
      ),
      

    ); 
  }
  Widget characterInfo(String title ,String value){
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
          text: title,
          style: TextStyle(
            fontSize: 21,
            color: Colors.white,
          fontWeight: FontWeight.bold
          )
        ),
        TextSpan(
          text: value ,
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18)
        )
        ]
      ),
      );

  }
  Widget buildDevider(double endended){
    return Divider(
      color: Colors.yellow,
      endIndent: endended,
      height: 50,
      thickness: 2,


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
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   characterInfo("Name : ",character.name!),
                  buildDevider(305),

                  characterInfo("Status : ",character.status!),
                  buildDevider(305),

                  characterInfo("Species : ",character.species!),
                  buildDevider(290),

                  character.type!.isEmpty?
                   Container():
                   characterInfo("Type : ",character.type!),
                  character.type!.isEmpty? Container():buildDevider(315),

                  characterInfo("Gender : ",character.gender!),
                  buildDevider(295),

                  characterInfo("Location : ",character.location!.name!),
                  buildDevider(280),

                  characterInfo("Created In : ",character.created!),
                  buildDevider(275),

                  
                  
                ],
              ),
            ),
            // SizedBox(
            //   height: 500,
            // )

          ]),),
        ]
      ),

    );
  }
}
