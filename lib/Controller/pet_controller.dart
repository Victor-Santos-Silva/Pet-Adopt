import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_adopt/models/Pet.dart';

class PetController {
  Future<List<Pet>> fetchPets() async {
    try {
      final response = await http.get(
          Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/pet/pets'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Pet.fromJson(json)).toList();
      } else {
        throw Exception('Erro ao carregar pets');
      }
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }

  Future<void> addPet(String token, Map<String, String> petData) async {
    try {
      final response = await http.post(
        Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/pet/create'),
        headers: {'Authorization': 'Bearer $token'},
        body: petData,
      );

      if (response.statusCode == 201) {
        print('Pet adicionado com sucesso');
      } else {
        print('Erro ao adicionar pet');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }

  Future<void> registerPet(
      String nome, String descricao, String foto, BuildContext context) async {
    try {
      // Simule que o token está armazenado em algum local (Ex: SharedPreferences)
      final String token = 'SEU_TOKEN_AQUI'; // Substituir pelo token real

      final response = await http.post(
        Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/pet/create'),
        headers: {
          'Authorization': 'Bearer $token', // Token de autenticação
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': nome,
          'description': descricao,
          'photo': foto,
        }),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pet cadastrado com sucesso!')),
        );
        Navigator.pop(context); // Retorna para a tela anterior
      } else {
        final error = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: ${error['message']}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao cadastrar o pet')),
      );
    }
  }
}
