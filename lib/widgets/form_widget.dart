import 'package:flutter/material.dart';
import 'package:pet_adopt/models/login_viewmodel.dart';

class FormWidget extends StatelessWidget {
  final LoginViewModel viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(32.0),
      color: Colors.white.withOpacity(0.8),
      child: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Usuário'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu usuário';
                }
                return null;
              },
              onSaved: viewModel.saveUsername,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira sua senha';
                }
                return null;
              },
              onSaved: viewModel.savePassword,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: viewModel.validateAndSave,
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
