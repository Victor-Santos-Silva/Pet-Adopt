import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_adopt/controllers/auth_controller.dart';

class PetRegisterController {
  Future<String?> registerPet({
    required String name,
    required String color,
    required double weight,
    required int age,
    required List<String> images,
  }) async {
    final token = await AuthController.getToken();

    if (token == null || token.isEmpty) {
      return 'Erro: Token não encontrado.';
    }

    final url =
        Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/pet/create');
    final body = jsonEncode({
      "name": name,
      "color": color,
      "weight": weight,
      "age": age,
      "images": images,
    });

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: body,
      );
    } catch (e) {
      return 'Erro de conexão: $e';
    }
  }
}
