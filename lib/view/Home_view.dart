import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Lista de pets
  List<dynamic> pets = [];
  bool isLoading = true; // Indicador de carregamento

  @override
  void initState() {
    super.initState();
    fetchPets(); // Chama a API ao iniciar a tela
  }

  // Método para consumir a API
  Future<void> fetchPets() async {
    try {
      final url =
          Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/pet/pets');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          pets = data; // Atualiza a lista de pets
          isLoading = false;
        });
      } else {
        throw Exception('Erro ao buscar os dados da API');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Erro: $e');
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
          : ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets[index];
                return ListTile(
                  title: Text(pet['name'] ?? 'Sem nome'), // Nome do pet
                  subtitle: Text(pet['type'] ?? 'Sem tipo'), // Tipo do pet
                );
              },
            ),
    );
  }
}
