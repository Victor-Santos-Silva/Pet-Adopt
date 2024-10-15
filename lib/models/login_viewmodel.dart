import 'package:flutter/material.dart';

class LoginViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _username = "admin";
  String? _password = "admin";

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      // Aqui você pode adicionar a lógica de autenticação
      print('Usuário: $_username, Senha: $_password');
      return true;
    }
    return false;
  }

  void saveUsername(String? username) {
    _username = username;
  }

  void savePassword(String? password) {
    _password = password;
  }
}
