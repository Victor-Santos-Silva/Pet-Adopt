import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_adopt/models/Pet.dart';

class PetsController with ChangeNotifier {
  List<Pet> pets = [];
  bool isLoading = true;

  PetsController() {
    fetchPets();
  }

  Future<void> fetchPets() async {
    const apiUrl = 'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['pets'] != null && data['pets'] is List) {
          pets =
              (data['pets'] as List).map((json) => Pet.fromJson(json)).toList();
        } else {
          pets = [];
        }
      } else {
        throw Exception(
            'Erro ao buscar os dados da API: ${response.statusCode}');
      }
    } catch (e) {
      pets = [];
      print('Erro ao carregar pets: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Widget buildPetsList() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (pets.isEmpty) {
      return Center(
        child: Text(
          'Nenhum pet encontrado!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: pets.length,
      itemBuilder: (context, index) {
        final pet = pets[index];
        return Card(
          child: ListTile(
            title: Text(
              pet.name,
            ), // Certifique-se que o modelo `Pet` tem um atributo `name`
          ),
        );
      },
    );
  }
}
