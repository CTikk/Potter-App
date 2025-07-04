import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';

class PotterApiService {
  final String baseUrl = 'https://api.potterdb.com/v1';

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/characters'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List data = jsonData['data'];
      return data.map((item) => Character.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}