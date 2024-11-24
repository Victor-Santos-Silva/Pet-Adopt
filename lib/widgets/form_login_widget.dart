import 'package:flutter/material.dart';
import 'package:pet_adopt/Controller/auth_controller.dart';

class FormLoginWidget extends StatelessWidget {
  // Controladores para capturar os textos dos campos de entrada
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              'Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController, // Conectado ao controlador
              decoration: const InputDecoration(labelText: 'Usuário'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu usuário';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController, // Conectado ao controlador
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
              onPressed: () {
                // Captura os valores dos controladores e chama o método de login
                final email = emailController.text;
                final password = passwordController.text;

                // Verifica se os campos não estão vazios
                if (email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Preencha todos os campos!')),
                  );
                } else {
                  // Chama o controlador para realizar o login
                  AuthController().loginUser(email, password, context);
                }
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
