import 'package:flutter/material.dart';
import 'package:pet_adopt/view/cadastro_view.dart'; // Cadastro de usuario
import 'package:pet_adopt/view/login_view.dart'; // Cadastro de login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CadastroView(),
    );
  }
}
