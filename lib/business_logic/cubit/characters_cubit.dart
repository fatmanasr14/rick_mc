import 'package:breakbad/business_logic/cubit/characters_state.dart';
import 'package:breakbad/data/models/character.dart';
import 'package:breakbad/data/repositry/character_repositry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository;
   List<Results> characters=[];

  CharacterCubit(this.characterRepository) : super(CharacterInitial());

  // 
  Future<void> getAllCharacters() async {
    try {
      final characters = await characterRepository.getAllCharacters();
      emit(CharacterLoaded(characters));
      this.characters = characters;
    } catch (error) {
      // Handle error if necessary
      print('Error: $error');
    }
  }
}
