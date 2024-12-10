import 'package:flutter/material.dart';
import 'package:pet_adopt/models/Pet.dart';
import 'package:pet_adopt/view/pet_description_view.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.pet,
  });

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Bordas arredondadas
        ),
        elevation: 5, // Sombras para profundidade
        color: Colors.green[50], // Cor de fundo suave
        child: Container(
          padding: EdgeInsets.all(16), // Espaçamento interno
          child: Row(
            children: [
              // Imagem do pet
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: pet.images.isNotEmpty
                    ? Image.network(
                        pet.images[0],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[200],
                          );
                        },
                      )
                    : Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.pets,
                          size: 40,
                          color: Colors.grey[600],
                        ),
                      ),
              ),
              SizedBox(width: 16), // Espaço entre a imagem e o texto
              // Informações do pet
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pet.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green[800],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Cor: ${pet.color}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      'Idade: ${pet.age} anos',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      'Peso: ${pet.weight} kg',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              // Botão de ícone (+) à direita
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PetDescriptionView(pet: pet),
                    ),
                  );
                },
                icon: Icon(Icons.add_circle),
                color: Colors.green,
                iconSize: 30, // Tamanho do ícone
              ),
            ],
          ),
        ),
      ),
    );
  }
}
