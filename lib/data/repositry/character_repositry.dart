import 'package:breakbad/data/models/character.dart'; // استيراد الموديل Character
import 'package:breakbad/data/web_services/character_webServices.dart';

class CharacterRepository {
  final CharacterWebservices characterWebservices;

  CharacterRepository({required this.characterWebservices});

  // دالة لجلب الشخصيات من الـ API وتحويلها إلى كائنات من نوع Character
  Future<List<Results>> getAllCharacters() async {
    try {
      final characters = await characterWebservices.getAllCharacters();
      return characters.map((character) => Results.fromJson(character)).toList();
    } catch (e) {
      print('Error in CharacterRepository: $e');
      return [];
    }
  }
}
