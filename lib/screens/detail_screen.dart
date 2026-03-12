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
      body: Center(
        child: Text(hero.name),
      ),
    );
  }
}