import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_adopt/middleware/auth_controller.dart';

class LoginController {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url =
        Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/user/login');
    final body = jsonEncode({
      "email": email,
      "password": password,
    });

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await AuthController.saveToken(data['token']);
        return {"success": true, "message": "Login bem-sucedido"};
      } else {
        final error = jsonDecode(response.body);
        return {
          "success": false,
          "message": error['message'] ?? 'Falha ao fazer login'
        };
      }
    } catch (e) {
      return {"success": false, "message": "Erro de conexão: $e"};
    }
  }
}
