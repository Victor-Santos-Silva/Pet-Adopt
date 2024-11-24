import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_adopt/models/User.dart';

class AuthController {
  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/user/login'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = User.fromJson(data);
        Navigator.pushNamed(context, '/home', arguments: user);
      } else {
        print('Erro no login');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }

  Future<void> registerUser(
      String nome, String email, String senha, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/user/register'),
        body: {
          'name': nome,
          'email': email,
          'password': senha,
        },
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro realizado com sucesso!')),
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
        const SnackBar(content: Text('Erro ao realizar o cadastro')),
      );
    }
  }
}
