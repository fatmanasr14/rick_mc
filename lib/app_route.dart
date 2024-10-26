import 'package:breakbad/data/models/character.dart';
import 'package:breakbad/data/repositry/character_repositry.dart';
import 'package:breakbad/data/web_services/character_webServices.dart';
import 'package:breakbad/presentation/views/character_details_screen.dart';
import 'package:breakbad/presentation/views/character_screen.dart';
import 'package:flutter/material.dart';
import 'package:breakbad/business_logic/cubit/characters_cubit.dart';
import 'package:breakbad/constant/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  late CharacterRepository characterRepository;
  late CharacterCubit characterCubit;

  AppRoute() {
    characterRepository = CharacterRepository(CharacterWebservices());
    characterCubit = CharacterCubit(characterRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => CharacterCubit(characterRepository),
                child: CharacterScreen()));

      case characterDetail:
        final character = settings.arguments as Results;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(character: character),
        );

      default:
        return null;
    }
  }
}
