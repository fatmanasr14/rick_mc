import 'package:bloc/bloc.dart';
import 'package:breakbad/business_logic/cubit/characters_state.dart';
import 'package:breakbad/data/models/character.dart';
import 'package:breakbad/data/repositry/character_repositry.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository;
  late final List<Results> characters;

  CharacterCubit(this.characterRepository) : super(CharacterInitial());

  Future<void> getAllCharacters() async {
    try {
      emit(CharacterLoading()); // عرض حالة التحميل
      final characters = await characterRepository.getAllCharacters();
      emit(CharacterLoaded(characters)); // عرض الشخصيات عند التحميل بنجاح
    } catch (e) {
      emit(CharacterError(e.toString())); // عرض حالة الخطأ
    }
  }
}
