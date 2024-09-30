import 'package:breakbad/data/web_services/character_webServices.dart';
import 'package:flutter/material.dart';
import 'package:breakbad/business_logic/cubit/characters_cubit.dart';
import 'package:breakbad/constant/strings.dart';
import 'package:breakbad/data/repositry/character_repositry.dart';
import 'package:breakbad/presentation/views/character_details_screen.dart';
import 'package:breakbad/presentation/views/character_screen.dart';
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
                create: (BuildContext context) => characterCubit,
                child: const CharacterScreen()));

      case characterDetail:
        return MaterialPageRoute(builder: (_) => const CharacterDetailsScreen());

      default:
        return null;
    }
  }
}
