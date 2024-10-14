import 'package:flutter/material.dart';
import 'package:pet_adopt/view/dashboard_screen.dart';
import 'package:pet_adopt/widgets/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        title: "Pet Adopt",
        home: Dashboard(),
      ),
    );
  }
}
