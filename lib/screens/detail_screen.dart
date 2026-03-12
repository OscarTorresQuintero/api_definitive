import 'package:flutter/material.dart';
import '../models/superhero_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final hero = ModalRoute.of(context)!.settings.arguments as SuperheroModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(hero.name),
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Hero(
              tag: hero.id,
              child: Image.network(
                hero.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              hero.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Publisher: ${hero.publisher}",
              style: const TextStyle(color: Colors.grey),
            ),

          ],
        ),
      ),
    );
  }
}