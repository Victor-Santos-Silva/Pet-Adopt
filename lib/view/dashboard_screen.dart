import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on),
                  Text("Cotia, São Paulo"),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(32.0),
              ),
              Text("OFERTAS"),
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {},
              ),
              Text("Mais vendidos"),
              Text("Cards de frutas "),
              SizedBox(
                height: 250,
              )
            ],
          ),
        ),
      ),
    );
  }
}
