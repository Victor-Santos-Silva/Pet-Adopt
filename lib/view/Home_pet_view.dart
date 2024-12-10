import 'package:flutter/material.dart';
import 'package:pet_adopt/controllers/pet_controller.dart';
import 'package:pet_adopt/controllers/auth_controller.dart';
import 'package:pet_adopt/models/Pet.dart';
import 'package:pet_adopt/view/Cadastro_pet_view.dart';
import 'package:pet_adopt/widgets/Card_widget.dart';
import 'package:pet_adopt/widgets/Wallpaper_widget.dart';

class HomePetView extends StatefulWidget {
  @override
  _HomePetViewState createState() => _HomePetViewState();
}

class _HomePetViewState extends State<HomePetView> {
  final PetController _controller = PetController();
  List<Pet> pets = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserPets();
  }

  Future<void> _loadUserPets() async {
    setState(() {
      isLoading = true;
    });

    try {
      final token = await AuthController.getToken(); // Obtém o token armazenado
      if (token != null) {
        final userPets = await _controller.fetchUserPets(token);
        setState(() {
          pets = userPets;
        });
      } else {
        print('Token não encontrado. Por favor, faça login novamente.');
      }
    } catch (e) {
      print('Erro ao carregar os pets: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
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
