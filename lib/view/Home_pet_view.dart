import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_adopt/models/Pet.dart';
import 'package:pet_adopt/view/Cadastro_pet_view.dart';
import 'package:pet_adopt/widgets/Card_widget.dart';
import 'package:pet_adopt/widgets/Header_widget.dart';
import 'package:pet_adopt/widgets/Wallpaper_widget.dart';

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
      body: Wallpaper(
        imagePath: 'assets/images/wallpaper.jpg', // Fundo da página
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // Exibe o carregamento ou a lista de pets
            isLoading
                ? Center(child: CircularProgressIndicator())
                : pets.isEmpty
                    ? Center(
                        child: Text(
                          'Nenhum pet encontrado!',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: pets.length,
                          itemBuilder: (context, index) {
                            final pet = pets[index];
                            return CardWidget(pet: pet);
                          },
                        ),
                      ),
            // Botões abaixo da lista
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CadastroPetView()),
                      );
                    },
                    icon:
                        Icon(Icons.add, color: Colors.white), // Ícone do botão
                    label: Text(
                      "Cadastrar Pet",
                      style: TextStyle(color: Colors.white), // Cor do texto
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue, // Cor do botão
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Bordas arredondadas
                      ),
                      elevation: 5, // Elevação para sombra
                    ),
                  ),
                  SizedBox(width: 20), // Espaço entre os botões
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context); // Volta para a Home Principal
                    },
                    icon:
                        Icon(Icons.home, color: Colors.white), // Ícone do botão
                    label: Text(
                      "Home",
                      style: TextStyle(color: Colors.white), // Cor do texto
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green, // Cor do botão
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Bordas arredondadas
                      ),
                      elevation: 5, // Elevação para sombra
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
