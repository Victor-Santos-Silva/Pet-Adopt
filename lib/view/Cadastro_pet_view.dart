import 'package:flutter/material.dart';
import 'package:pet_adopt/controllers/pet_register_controller.dart';
import 'package:pet_adopt/widgets/Wallpaper_widget.dart';

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

  final PetRegisterController _controller = PetRegisterController();
  bool _isLoading = false;

  Future<void> registerPet() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final errorMessage = await _controller.registerPet(
        name: _nameController.text,
        color: _colorController.text,
        weight: double.tryParse(_weightController.text) ?? 0.0,
        age: int.tryParse(_ageController.text) ?? 0,
        images: [_imageController.text],
      );

      setState(() {
        _isLoading = false;
      });

      if (errorMessage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pet registrado com sucesso!')),
        );
        _nameController.clear();
        _colorController.clear();
        _weightController.clear();
        _ageController.clear();
        _imageController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: $errorMessage')),
        );
      }
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Wallpaper(
      imagePath: 'assets/images/Background 1.png', // Fundo do cadastro
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              // Contorno do texto "Registro de Pet"
              Text(
                "REGISTRO DE PET",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 5.0
                    ..color = Colors.black,
                ),
              ),
              // Texto preenchido
              Text(
                "REGISTRO DE PET",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Nome do pet
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        labelText: 'Nome do Pet',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o nome do pet';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    // Cor do pet
                    TextFormField(
                      controller: _colorController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        labelText: 'Cor',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a cor do pet';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    // Peso do pet
                    TextFormField(
                      controller: _weightController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        labelText: 'Peso (kg)',
                      ),
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
                    // Idade do pet
                    TextFormField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        labelText: 'Idade (anos)',
                      ),
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
                    // URL da imagem
                    TextFormField(
                      controller: _imageController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        labelText: 'URL da Imagem',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a URL da imagem';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 32),
                    // Botão Registrar Pet
                    _isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: registerPet,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                            ),
                            child: Text(
                              'Registrar Pet',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

}
