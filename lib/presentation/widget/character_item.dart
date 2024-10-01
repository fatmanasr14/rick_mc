import 'package:breakbad/data/models/character.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Results character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8,8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: GridTile(child: Container(
        ///until images loading
        color: Colors.grey,
        child: character.image!.isNotEmpty?FadeInImage.assetNetwork(
          height: double.infinity,
          width: double.infinity,
          placeholder: "assets/images/loading.gif", image: character.image!,fit: BoxFit.cover,):Image.asset("assets/images/loading1.gif")
      )),

    );
  }
}