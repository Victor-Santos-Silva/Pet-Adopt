import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_adopt/models/Pet.dart';

class PetController {
  final String apiUrl = 'https://pet-adopt-dq32j.ondigitalocean.app/pet/mypets';

  Future<List<Pet>> fetchUserPets(String token) async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token', // Enviar o token no cabeçalho
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['pets'] != null && data['pets'] is List) {
          return (data['pets'] as List)
              .map((json) => Pet.fromJson(json))
              .toList();
        } else {
          print('Nenhum pet encontrado.');
          return [];
        }
      } else {
        throw Exception('Erro ao buscar os pets: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao carregar pets: $e');
      return [];
    }
  }
}
