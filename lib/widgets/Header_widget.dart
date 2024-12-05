import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? imagePath;
  final Color backgroundColor;

  const HeaderWidget({
    Key? key,
    required this.title,
    this.subtitle,
    this.imagePath,
    this.backgroundColor = Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Stack(
        children: [
          // Conteúdo principal (Textos)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    child: Image.asset(
                      'assets/images/foto de perfil.png',
                      height: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
