import 'package:flutter/material.dart';
import 'package:pet_adopt/widgets/background_widget.dart';
import 'package:pet_adopt/widgets/form_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(imagePath: "assets/images/Background 1.png"),
          Center(
            child: FormWidget(),
          ),
        ],
      ),
    );
  }
}
