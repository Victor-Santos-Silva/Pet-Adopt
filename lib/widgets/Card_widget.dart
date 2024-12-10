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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Bordas arredondadas
          ),
          elevation: 5, // Sombras para dar profundidade
          color: Colors.green[100], // Cor de fundo suave (pode ajustar)
          child: Container(
            padding: EdgeInsets.all(16), // Padding para espaçamento interno
            height: 150,
            width: 380,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Imagem do pet
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      12), // Bordas arredondadas na imagem
                  child: pet.images.isNotEmpty
                      ? Image.network(
                          pet.images[0],
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      : Icon(Icons.pets,
                          size: 50,
                          color: Colors.grey), // Ícone se não houver imagem
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pet.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      pet.color,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${pet.age} anos',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${pet.weight} kg',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
