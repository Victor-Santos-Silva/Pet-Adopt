import 'package:flutter/material.dart';
import 'package:pet_adopt/models/Pet.dart';

class Card_widget extends StatelessWidget {
  const Card_widget({
    super.key,
    required this.pet,
  });

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: pet.images.isNotEmpty
            ? Image.network(
                pet.images[0], // Mostra a primeira imagem
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )
            : Icon(Icons.pets, size: 50),
        title: Text(pet.name), // Nome do pet
        subtitle: Text(
            'Idade: ${pet.age} anos\nCor: ${pet.color}'), // Outras informações do pet
        trailing: Text('Peso: ${pet.weight} kg'),
      ),
    );
  }
}
