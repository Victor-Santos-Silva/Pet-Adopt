import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final dynamic pet;

  const CardWidget({super.key, required this.pet});

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
            child: pet['photo'] != null
                ? Image.network(
                    pet['photo'],
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.pets, size: 60),
          ),
          // Conteúdo abaixo da imagem
          Padding(
            padding: const EdgeInsets.all(
                15.0), // Diminuindo o padding ao redor do texto
            child: Stack(
              children: [
                // Texto de borda preta (fundo)
                Text(
                  pet['name'] ?? 'Nome não informado',
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
                  pet['name'] ?? 'Nome não informado',
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
