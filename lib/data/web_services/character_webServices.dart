import 'package:breakbad/constant/strings.dart';
import 'package:dio/dio.dart';

class CharacterWebservices {
  late Dio dio;
  CharacterWebservices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }
  
  Future<List<dynamic>> getAllCharacters() async {
  try {
    Response response = await dio.get('character');
    if (response.statusCode == 200) {
      print(response.data['results']);
      return response.data['results']; // Assuming 'results' key exists
    } else {
      print('Failed to load characters. Status code: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    print('Error: ${e.toString()}'); // Provides a clearer error message
    return [];
  }
}

  
}
