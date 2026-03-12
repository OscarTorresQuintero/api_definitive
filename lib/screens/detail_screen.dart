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
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Power Stats",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              _statRow("Intelligence", hero.powerStats.intelligence),
              _statRow("Strength", hero.powerStats.strength),
              _statRow("Speed", hero.powerStats.speed),
              _statRow("Combat", hero.powerStats.combat),

            ],
          ),
        ),
      ),
    );
  }

  Widget _statRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}