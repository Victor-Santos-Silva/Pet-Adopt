import 'package:flutter/material.dart';
import 'package:pet_adopt/Controller/auth_controller.dart';

class FormCadastroWidget extends StatefulWidget {
  @override
  _FormCadastroWidgetState createState() => _FormCadastroWidgetState();
}

class _FormCadastroWidgetState extends State<FormCadastroWidget> {
  final _formKey = GlobalKey<FormState>(); // Chave para o Form
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(32.0),
      color: Colors.white.withOpacity(0.8),
      child: Form(
        key: _formKey, // Atribuindo a chave global ao Form
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Cadastro de Usuário',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu nome';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: senhaController,
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
                // Printando os valores antes da validação
                print('Nome: ${nomeController.text}');
                print('Email: ${emailController.text}');
                print('Senha: ${senhaController.text}');

                // Valida o formulário usando a chave global
                if (_formKey.currentState?.validate() ?? false) {
                  final nome = nomeController.text;
                  final email = emailController.text;
                  final senha = senhaController.text;

                  // Chama o método para registrar o usuário
                  AuthController().registerUser(nome, email, senha, context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Por favor, preencha todos os campos corretamente!')),
                  );
                }
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
