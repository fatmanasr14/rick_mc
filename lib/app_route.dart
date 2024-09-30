import 'package:breakbad/constant/strings.dart';
import 'package:breakbad/presentation/views/character_details_screen.dart';
import 'package:breakbad/presentation/views/character_screen.dart';
import 'package:flutter/material.dart';

class AppRoute{
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case characterScreen:
      return MaterialPageRoute(builder: (_) => CharacterScreen());

      case characterDetail:
      return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }


  }
}