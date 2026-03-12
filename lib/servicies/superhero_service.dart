 import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/superhero_model.dart';

class SuperheroService {
  static const String _token = '4e954f3c91f01feb33ad42739c087f6d';
  static const String _baseUrl = 'https://superheroapi.com/api/$_token';

  static const List<String> heroIds = [
    '620', '149', '70', '346', '720', '644'
  ];

  Future<List<SuperheroModel>> getHeroes() async {
    List<SuperheroModel> heroes = [];
    for (String id in heroIds) {
      try {
        final response = await http.get(Uri.parse('$_baseUrl/$id'));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          heroes.add(SuperheroModel.fromJson(data));
        }
      } catch (e) {
        debugPrint('Error fetching hero $id: $e');
      }
    }
    return heroes;
  }
}