import 'package:flutter/material.dart';
import 'package:pet_adopt/view/Cadastro_user_view.dart';
import 'package:pet_adopt/view/Home_view.dart';
import 'package:pet_adopt/view/Login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Define a rota inicial
      routes: {
        '/': (context) => const LoginView(), // Tela de Login
        '/home': (context) => HomeView(), // Tela de Home
        '/register': (context) => const CadastroUserView(), // Tela de Cadastro de Usuário
      },
    );
  }
}
