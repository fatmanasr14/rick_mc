import 'package:breakbad/data/models/character.dart';

abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Results> characters;

  CharacterLoaded(this.characters);
}

class CharacterError extends CharacterState {
  final String message;

  CharacterError(this.message);
}
