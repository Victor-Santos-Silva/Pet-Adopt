import 'package:flutter/material.dart';
import 'dart:convert'; // Para manipulação de JSON
import 'package:http/http.dart' as http; // Biblioteca HTTP

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  // Método para fazer login
  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final url =
          Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/user/login');
      final body = jsonEncode({
        "email": _emailController.text,
        "password": _passwordController.text,
      });

      try {
        final response = await http.post(
          url,
          headers: {"Content-Type": "application/json"},
          body: body,
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);

          // Exibe mensagem de sucesso e navega para outra tela
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login bem-sucedido!'),
            ),
          );

          // Substitua por sua lógica de navegação
          Navigator.pushReplacementNamed(context, '/view/pet');
        } else {
          final error = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Erro: ${error['message'] ?? 'Falha ao fazer login'}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro de conexão: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Campo de E-mail
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Insira um e-mail válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Campo de Senha
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              // Botão de Login
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: login,
                      child: Text('Entrar'),
                    ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Criar Conta'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
