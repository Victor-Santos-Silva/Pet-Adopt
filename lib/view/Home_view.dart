import 'package:flutter/material.dart';
import 'package:pet_adopt/widgets/background_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(
            imagePath: "assets/images/wallpaper.jpg",
          ),
          Container(
            color: Colors.green,
            height: 150,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 50),
                child: Text(
                  "Pet Adopt",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60, left: 100),
                width: 80,
                child: Image.asset('assets/images/foto de perfil.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
