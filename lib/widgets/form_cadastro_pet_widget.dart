import 'package:flutter/material.dart';
import 'package:pet_adopt/Controller/pet_controller.dart';

class FormCadastroPetWidget extends StatelessWidget {
  // Controladores para capturar os valores dos campos
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController fotoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(32.0),
      color: Colors.white.withOpacity(0.8),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Cadastro de Pet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nomeController, // Conecta ao controlador
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o nome do pet';
                }
                return null;
              },
            ),
            TextFormField(
              controller: descricaoController, // Conecta ao controlador
              decoration: const InputDecoration(labelText: 'Descrição'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a descrição do pet';
                }
                return null;
              },
            ),
            TextFormField(
              controller: fotoController, // Conecta ao controlador
              decoration: const InputDecoration(labelText: 'URL da Foto'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a URL da foto do pet';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final nome = nomeController.text;
                final descricao = descricaoController.text;
                final foto = fotoController.text;

                if (nome.isEmpty || descricao.isEmpty || foto.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Preencha todos os campos!')),
                  );
                } else {
                  // Chama o método para cadastrar o pet
                  PetController().registerPet(nome, descricao, foto, context);
                }
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
