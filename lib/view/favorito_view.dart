import 'package:flutter/material.dart';
import 'package:pet_adopt/widgets/background_widget.dart';
import 'package:pet_adopt/widgets/card_widget.dart';

class FavoritoView extends StatelessWidget {
  const FavoritoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(imagePath: "assets/images/wallpaper.jpg"),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  // Usando Stack para adicionar borda ao texto "Favoritos"
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Texto de borda preta
                      Text(
                        "Favoritos:",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6 // Espessura da borda
                            ..color = Colors.black, // Cor da borda
                        ),
                      ),
                      // Texto principal em verde
                      const Text(
                        "Favoritos:",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Espaçamento entre o título e os cards
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centraliza os cards
                    children: [
                      CardWidget(),
                      SizedBox(width: 15), // Espaçamento entre os cards
                      CardWidget(),
                    ],
                  ),
                  SizedBox(
                      height:
                          20), // Espaçamento vertical entre as linhas de cards
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centraliza os cards
                    children: [
                      CardWidget(),
                      SizedBox(width: 20), // Espaçamento entre os cards
                      CardWidget(),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centraliza os cards
                    children: [
                      CardWidget(),
                      SizedBox(width: 20), // Espaçamento entre os cards
                      CardWidget(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
