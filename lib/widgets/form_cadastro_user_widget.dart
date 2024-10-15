import 'package:flutter/material.dart';


class FormCadastroWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(32.0),
      color: Colors.white.withOpacity(0.8),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Cadastro de Usuario',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu nome';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu usuário';
                }
                return null;
              },
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
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {  },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
