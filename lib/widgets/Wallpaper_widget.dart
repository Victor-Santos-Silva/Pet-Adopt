import 'package:flutter/material.dart';

class Wallpaper extends StatelessWidget {
  final Widget child;
  final String imagePath;

  const Wallpaper({required this.child, required this.imagePath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath), // Caminho da imagem do papel de parede
          fit: BoxFit.cover, // Ajusta a imagem para cobrir todo o fundo
        ),
      ),
      child: child, // Conteúdo sobre o papel de parede
    );
  }
}
