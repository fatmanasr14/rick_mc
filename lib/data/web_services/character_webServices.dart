import 'dart:io';
import 'dart:convert';
import 'package:breakbad/constant/strings.dart';

class CharacterWebservices {
  late HttpClient httpClient;

  CharacterWebservices() {
    httpClient = HttpClient();
    // Skip certificate verification in development (only for local development)
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      final url = Uri.parse('$baseUrl/character');
      HttpClientRequest request = await httpClient.getUrl(url);
      HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        String jsonResponse = await response.transform(utf8.decoder).join();
        final data = jsonDecode(jsonResponse);
        print(data.toString());
        return data['results']; // Assuming 'results' is a key in the response
      } else {
        print('Failed to load characters. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      return [];
    }
  }
}
