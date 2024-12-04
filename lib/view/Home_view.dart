import 'package:flutter/material.dart';
import 'package:pet_adopt/controllers/home_controller.dart';
import 'package:pet_adopt/view/Home_pet_view.dart';
import 'package:pet_adopt/widgets/Card_widget.dart';
import 'package:pet_adopt/widgets/Wallpaper_widget.dart';
import 'Cadastro_pet_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _loadPets(); // Inicializa o carregamento dos pets
  }

  Future<void> _loadPets() async {
    await _controller.fetchPets();
    setState(() {}); // Atualiza a UI após carregar os dados
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text("Bem-vindo"),
      ), */
      body: Wallpaper(
        imagePath: 'assets/images/wallpaper.jpg',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Exibe o carregamento ou a lista de pets
            _controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : _controller.pets.isEmpty
                    ? Center(
                        child: Text(
                          'Nenhum pet encontrado!',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _controller.pets.length,
                          itemBuilder: (context, index) {
                            final pet = _controller.pets[index];
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
                        MaterialPageRoute(builder: (context) => HomePetView()),
                      );
                    },
                    icon:
                        Icon(Icons.pets, color: Colors.white), // Ícone do botão
                    label: Text(
                      "Pets Cadastrados",
                      style: TextStyle(color: Colors.white), // Cor do texto
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green, // Cor do texto e ícone
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Bordas arredondadas
                      ),
                      elevation: 5, // Elevação para dar sombra
                    ),
                  ),
                  SizedBox(width: 20), // Espaço entre os botões
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
                      backgroundColor: Colors.blue, // Cor do texto e ícone
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Bordas arredondadas
                      ),
                      elevation: 5, // Elevação para dar sombra
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
