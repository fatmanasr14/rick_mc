import 'package:breakbad/data/models/character.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Results character;
  const CharacterItem({super.key, required this.character});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8,10, 8,8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child:
       GridTile(
        child: Hero(
          tag: character.id!,
          child: Container(
          ///until images loading
          color: Colors.grey,
          child: character.image!.isNotEmpty?FadeInImage.assetNetwork(
            height: double.infinity,
            width: double.infinity,
            placeholder: "assets/images/loading.gif", image: character.image!,fit: BoxFit.cover,):Image.asset("assets/images/image2.jpg")
                ),
        ),
      footer: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        color: Colors.black,
        alignment: Alignment.bottomCenter,
        child: Text('${character.name}',style: TextStyle(
          height: 1.3,
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
        ),
      ),
      )
      ,

    );
  }
}