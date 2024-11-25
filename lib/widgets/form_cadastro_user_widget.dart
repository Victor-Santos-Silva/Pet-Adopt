import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pet_adopt/widgets/form_login_widget.dart';

class FormCadastroWidget extends StatefulWidget {
  @override
  _FormCadastroWidgetState createState() => _FormCadastroWidgetState();
}

class _FormCadastroWidgetState extends State<FormCadastroWidget> {
  final _formKey = GlobalKey<FormState>(); // Chave para o Form
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  Future<void> _registrarUsuario(String nome, String email, String telefone,
      String senha, String confirmaSenha) async {
    const url = 'https://pet-adopt-dq32j.ondigitalocean.app/user/register';
    final body = jsonEncode({
      "name": nome,
      "email": email,
      "phone": telefone,
      "password": senha,
      "confirmpassword": confirmaSenha,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 201) {
        // Registro bem-sucedido
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário cadastrado com sucesso!')),
        );

        // Redireciona para a tela de login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FormLoginWidget()),
        );
      } else {
        // Erro no registro
        final responseBody = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro: ${responseBody["message"] ?? "Desconhecido"}'),
          ),
        );
      }
    } catch (e) {
      // Erro na conexão
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao conectar: $e')),
      );
    }
  }

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
                if (!RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(value)) {
                  return 'Por favor, insira um email válido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: telefoneController,
              decoration: const InputDecoration(labelText: 'Telefone'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu telefone';
                }
                if (!RegExp(r"^\+?[0-9]{10,15}$").hasMatch(value)) {
                  return 'Por favor, insira um telefone válido';
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
                if (value.length < 6) {
                  return 'A senha deve ter pelo menos 6 caracteres';
                }
                return null;
              },
            ),
            TextFormField(
              controller: confirmarSenhaController,
              decoration: const InputDecoration(labelText: 'Confirmar Senha'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, confirme sua senha';
                }
                if (value != senhaController.text) {
                  return 'As senhas não coincidem';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Remove o foco de todos os campos
                FocusScope.of(context).unfocus();

                // Valida o formulário usando a chave global
                if (_formKey.currentState?.validate() ?? false) {
                  final nome = nomeController.text;
                  final email = emailController.text;
                  final telefone = telefoneController.text;
                  final senha = senhaController.text;
                  final confirmarsenha = confirmarSenhaController.text;

                  // Chama o método para registrar o usuário
                  _registrarUsuario(
                      nome, email, telefone, senha, confirmarsenha);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Por favor, preencha todos os campos corretamente!'),
                    ),
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

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    telefoneController.dispose();
    senhaController.dispose();
    confirmarSenhaController.dispose();
    super.dispose();
  }
}
