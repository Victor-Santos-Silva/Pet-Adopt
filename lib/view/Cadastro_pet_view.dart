import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CadastroPetView extends StatefulWidget {
  const CadastroPetView({Key? key}) : super(key: key);

  @override
  State<CadastroPetView> createState() => _CadastroPetViewState();
}

class _CadastroPetViewState extends State<CadastroPetView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _colorController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  final _imageController = TextEditingController();

  bool _isLoading = false;

  // Função para enviar os dados para a API
  Future<void> registerPet() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final url = Uri.parse(
          'https://pet-adopt-dq32j.ondigitalocean.app/pet/create'); // Altere para sua URL
      final body = jsonEncode({
        "name": _nameController.text,
        "color": _colorController.text,
        "weight": double.tryParse(_weightController.text) ?? 0.0,
        "age": int.tryParse(_ageController.text) ?? 0,
        "images": [
          _imageController.text
        ], // Adicionando a imagem em formato de lista
      });

      try {
        final response = await http.post(
          url,
          headers: {"Content-Type": "application/json"},
          body: body,
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Pet registrado com sucesso!'),
            ),
          );
          Navigator.pushReplacementNamed(context, '/');
        } else {
          final error = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Erro: ${error['message'] ?? 'Falha ao registrar'}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro de conexão: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Nome
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do pet';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Cor
              TextFormField(
                controller: _colorController,
                decoration: InputDecoration(labelText: 'Cor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a cor do pet';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Peso
              TextFormField(
                controller: _weightController,
                decoration: InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o peso do pet';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Insira um valor numérico válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Idade
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Idade (anos)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a idade do pet';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Insira um valor numérico válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Imagem
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(labelText: 'URL da Imagem'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a URL da imagem';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              // Botão de Registrar
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: registerPet,
                      child: Text('Registrar Pet'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
