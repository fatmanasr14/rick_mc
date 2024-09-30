import 'package:bloc/bloc.dart';
import 'package:breakbad/business_logic/cubit/characters_state.dart';
import 'package:breakbad/data/models/character.dart';
import 'package:breakbad/data/repositry/character_repositry.dart';


class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository;
  late final List<Results> characters;

  CharacterCubit(this.characterRepository) : super(CharacterInitial());

  // 
  Future<List<Results>> getAllCharacters() async {

     characterRepository.getAllCharacters().then((characters){
        emit(CharacterLoaded(characters));
        this.characters=characters;
      }) ;

      return characters;
    // try {
    //   emit(CharacterLoading());
      
    //   //loading state
    //   final characters = await characterRepository.getAllCharacters();
    //   emit(CharacterLoaded(characters)); // sucess state
    // } catch (e) {
    //   emit(CharacterError('Failed to fetch characters')); // error state
    // }
  }
}
