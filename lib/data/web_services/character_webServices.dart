import 'package:breakbad/constant/strings.dart';
import 'package:dio/dio.dart';

class CharacterWebservices{
  late Dio dio;
  CharacterWebservices(){
    BaseOptions options=BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,

    );
    dio=Dio(options); 
  }
  
   Future<List<dynamic>> getAllChracter() async {
    try {
      Response response = await dio.get('character');
      if (response.statusCode == 200) {
       print(response.data.toString());
       return response.data;
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
    
  }
}