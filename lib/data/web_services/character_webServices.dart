import 'dart:io';

import 'package:breakbad/constant/strings.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class CharacterWebservices {
  late Dio dio;
  CharacterWebservices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    };
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
