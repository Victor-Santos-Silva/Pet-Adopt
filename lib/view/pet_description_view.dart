import 'package:flutter/material.dart';
import 'package:pet_adopt/models/Pet.dart';

class PetDescriptionView extends StatelessWidget {
  final Pet pet;

  const PetDescriptionView({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(pet.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exibindo a imagem do pet
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: pet.images.isNotEmpty
                    ? Image.network(
                        pet.images[0],
                        width: double.infinity,
                        height: 350,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.pets,
                        size: 100,
                        color: Colors.grey[600],
                      ),
              ),
              SizedBox(height: 16),

              // Nome do pet
              Text(
                pet.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 8),

              // Detalhes do pet
              _buildInfoText('Idade', '${pet.age} anos'),
              _buildInfoText('Peso', '${pet.weight} kg'),
              _buildInfoText('Cor', pet.color),
              SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Adotar Pet',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método auxiliar para construir o texto de informações
  Widget _buildInfoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green[600],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
