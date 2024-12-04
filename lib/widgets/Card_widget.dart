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
      child: Container(
        constraints: BoxConstraints(minHeight: 80), // Define uma altura mínima
        child: ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: pet.images.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      pet.images[0],
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(Icons.pets, size: 50),
          ),
          title: Text(
            pet.name,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            'Idade: ${pet.age} anos\nCor: ${pet.color}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            'Peso: ${pet.weight} kg',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
