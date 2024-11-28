import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_adopt/models/Pet.dart';

class HomeController {
  final List<Pet> _pets = [];
  bool isLoading = true;

  List<Pet> get pets => List.unmodifiable(_pets); // Retorna uma cópia imutável

  Future<void> fetchPets() async {
    const apiUrl = 'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets';
    isLoading = true;

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['pets'] != null && data['pets'] is List) {
          _pets.clear();
          _pets
              .addAll((data['pets'] as List).map((json) => Pet.fromJson(json)));
        } else {
          print('Erro: Nenhuma lista encontrada na chave "pets".');
        }
      } else {
        throw Exception(
            'Erro ao buscar os dados da API: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao carregar pets: $e');
    } finally {
      isLoading = false;
    }
  }
}
