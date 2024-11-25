import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_adopt/models/User.dart';
import 'package:pet_adopt/view/Home_view.dart';

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
        final user = User.fromJson(data); // Mapeando dados para um modelo User
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeView(user: user), // Passa o usuário
          ),
        );
      } else {
        final error = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Erro: ${error["message"] ?? "Desconhecido"}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao conectar: $e')),
      );
    }
  }

  Future<void> registerUser(String nome, String email, String telefone,
      String senha, BuildContext context) async {
    const url = 'https://pet-adopt-dq32j.ondigitalocean.app/user/register';

    final body = jsonEncode({
      'name': nome,
      'email': email,
      'phone': telefone,
      'password': senha,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'}, // Define o cabeçalho
        body: body,
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro realizado com sucesso!')),
        );
        Navigator.pop(context); // Retorna para a tela anterior
      } else {
        final error = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Erro: ${error['message'] ?? 'Erro desconhecido'}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao realizar o cadastro: $e')),
      );
    }
  }
}
