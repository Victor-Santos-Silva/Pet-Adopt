import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_adopt/models/Pet.dart'; // Certifique-se de que o model está corretamente implementado e importado.

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Lista de pets
  List<Pet> pets = [];
  bool isLoading = true; // Indicador de carregamento

  @override
  void initState() {
    super.initState();
    _fetchPets(); // Chama a API ao iniciar a tela
  }

  Future<void> _fetchPets() async {
    const apiUrl = 'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Ajuste aqui para acessar a chave correta
        if (data['pets'] != null && data['pets'] is List) {
          setState(() {
            pets = (data['pets'] as List)
                .map((json) => Pet.fromJson(json))
                .toList();
            isLoading = false;
          });
        } else {
          setState(() {
            pets = [];
            isLoading = false;
          });
          print('Erro: Nenhuma lista encontrada na chave "pets".');
        }
      } else {
        throw Exception(
            'Erro ao buscar os dados da API: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Erro ao carregar pets: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem-vindo!"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Mostra o carregamento
          : pets.isEmpty
              ? Center(
                  child: Text(
                    'Nenhum pet encontrado!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  itemCount: pets.length,
                  itemBuilder: (context, index) {
                    final pet = pets[index];
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
                  },
                ),
    );
  }
}
