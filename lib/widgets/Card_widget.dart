import 'package:flutter/material.dart';
import 'package:pet_adopt/models/Pet.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.pet,
  });

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Bordas arredondadas
      ),
      elevation: 5, // Sombras para dar profundidade
      color: Colors.green[100], // Cor de fundo suave (pode ajustar)
      child: Container(
        padding: EdgeInsets.all(16), // Padding para espaçamento interno
        child: Row(
          children: [
            // Imagem do pet
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Bordas arredondadas na imagem
              child: pet.images.isNotEmpty
                  ? Image.network(
                      pet.images[0],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : Icon(Icons.pets, size: 50, color: Colors.grey), // Ícone se não houver imagem
            ),
            SizedBox(width: 16), // Espaçamento entre a imagem e os textos

            // Coluna com as informações do pet
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nome do pet
                  Text(
                    pet.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8), // Espaço entre nome e as informações

                  // Idade, Cor e Peso do pet
                  Text(
                    'Idade: ${pet.age} anos',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'Cor: ${pet.color}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8), // Espaço entre as informações e o peso

                  // Peso do pet
                  Text(
                    'Peso: ${pet.weight} kg',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
