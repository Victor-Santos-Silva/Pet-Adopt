import 'package:flutter/material.dart';
import 'package:pet_adopt/view/Cadastro_pet_view.dart';
import 'package:pet_adopt/view/Cadastro_user_view.dart';
import 'package:pet_adopt/view/Home_pet_view.dart';
import 'package:pet_adopt/view/Home_view.dart';
import 'package:pet_adopt/view/Login_view.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';
  static const String registerUser = '/register';
  static const String registerPet = '/register/pet';
  static const String viewPets = '/view/pet';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginView(),
    home: (context) => HomeView(),
    registerUser: (context) => const CadastroUserView(),
    registerPet: (context) => const CadastroPetView(),
    viewPets: (context) => HomePetView(),
  };
}
