import 'package:flutter/material.dart';
import 'package:pet_adopt/view/cadastro_user_view.dart'; // Cadastro de usuario
import 'package:pet_adopt/view/login_view.dart'; // Login de Usuario
import 'package:pet_adopt/view/Home_view.dart'; //Tela Home
import 'package:pet_adopt/view/cadastro_pet_view.dart'; // Cadastro de pet
import 'package:pet_adopt/view/favorito_view.dart'; // Tela de Favorito

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
