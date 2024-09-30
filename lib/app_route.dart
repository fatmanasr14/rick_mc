import 'package:breakbad/presentation/views/character_screen.dart';
import 'package:flutter/material.dart';

class AppRoute{
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case Characters:
      return MaterialPageRoute(builder: (_) => CharacterScreen());
    }


  }
}