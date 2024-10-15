import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Definindo a largura do card para ser menor
      decoration: BoxDecoration(
        color: Colors.green[200], // Cor de fundo do Container
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // Imagem dentro do Card
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ), // Bordas arredondadas para a imagem
            child: Image.asset(
              'assets/images/filhotinho 2.png',
              height: 120, // Reduzindo a altura da imagem
              width: 120, // Largura da imagem igual à do card
              fit: BoxFit.cover, // A imagem se ajusta ao espaço disponível
            ),
          ),
          // Conteúdo abaixo da imagem
          Padding(
            padding: const EdgeInsets.all(
                15.0), // Diminuindo o padding ao redor do texto
            child: Stack(
              children: [
                // Texto de borda preta (fundo)
                Text(
                  'Cachorro',
                  style: TextStyle(
                    fontSize: 20, // Tamanho da fonte
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6 // Define a espessura da borda
                      ..color = Colors.black, // Cor da borda
                  ),
                ),
                // Texto principal (branco)
                Text(
                  'Cachorro',
                  style: TextStyle(
                    fontSize: 20, // Tamanho da fonte
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Cor do texto principal
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
