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
        title: Text("Bem-vindo!"),
      ),
      body: Column(
        children: [
          _controller.isLoading
              ? Center(
                  child: CircularProgressIndicator()) // Mostra o carregamento
              : _controller.pets.isEmpty
                  ? Center(
                      child: Text(
                        'Nenhum pet encontrado!',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _controller.pets.length,
                      itemBuilder: (context, index) {
                        final pet = _controller.pets[index];
                        return Card_widget(pet: pet);
                      },
                    ),
          /* ElevatedButton(
            onPressed: () {
              // Navega para a página de cadastro de pet
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePetView()),
              );
            },
            child: Text('Ir para Perfil'), // Exemplo
          ), */
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navega para a página de cadastro de pet
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastroPetView()),
          );
        },
        child: Icon(Icons.add), // Ícone de "+" para o botão
        tooltip: 'Cadastrar Pet', // Texto descritivo ao segurar o botão
      ),
    );
  }
}
