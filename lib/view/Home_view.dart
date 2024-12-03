import 'package:flutter/material.dart';
import 'package:pet_adopt/controllers/home_controller.dart';
import 'package:pet_adopt/view/Home_pet_view.dart';
import 'package:pet_adopt/widgets/Card_widget.dart';
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
      appBar: AppBar(
        title: Text("Bem-vindo"),
      ),
      body: Column(
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
                          return Card_widget(pet: pet);
                        },
                      ),
                    ),
          // Botões abaixo da lista
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePetView()),
                    );
                  },
                  child: Icon(Icons.pets), // Ícone para "Pets Cadastrados"
                ),
                SizedBox(width: 20), // Espaço entre os botões
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastroPetView()),
                    );
                  },
                  child: Icon(Icons.add), // Ícone para "Cadastrar Pet"
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
