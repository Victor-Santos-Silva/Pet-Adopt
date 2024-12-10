import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_adopt/middleware/auth_controller.dart';

class UserRegisterController {
  Future<String?> registerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    final url =
        Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/user/register');
    final body = jsonEncode({
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "confirmpassword": confirmPassword,
    });

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        await AuthController.saveToken(token);
        return null; // Sucesso
      } else {
        final error = jsonDecode(response.body);
        return error['message'] ?? 'Erro desconhecido';
      }
    } catch (e) {
      return 'Erro de conexão: $e';
    }
  }
}
