import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_adopt/models/Pet.dart';
import 'package:pet_adopt/widgets/Card_widget.dart';

import 'Cadastro_pet_view.dart'; // Certifique-se de que o model está corretamente implementado e importado.

class HomePetView extends StatefulWidget {
  @override
  State<HomePetView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomePetView> {
  // Lista de pets
  List<Pet> pets = [];
  bool isLoading = true; // Indicador de carregamento

  @override
  void initState() {
    super.initState();
    _fetchPets(); // Chama a API ao iniciar a tela
  }

  Future<void> _fetchPets() async {
    const apiUrl = 'https://pet-adopt-dq32j.ondigitalocean.app/pet/mypets';

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
        title: Text("Pets Cadastrados"),
      ),
      body: Column(
        children: [
          isLoading
              ? Center(
                  child: CircularProgressIndicator()) // Mostra o carregamento
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
                        return Card_widget(pet: pet);
                      },
                    ),
        ],
      ),
    );
  }
}
