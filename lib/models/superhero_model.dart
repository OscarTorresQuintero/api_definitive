 import 'powerstats_model.dart';

class SuperheroModel {
  final String id;
  final String name;
  final String imageUrl;
  final String publisher;
  final PowerStats powerStats;

  SuperheroModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.publisher,
    required this.powerStats,
  });

  factory SuperheroModel.fromJson(Map<String, dynamic> json) {
    return SuperheroModel(
      id: json['id'].toString(),
      name: json['name'] ?? 'Unknown',
      imageUrl: json['image']['url'] ?? '',
      publisher: json['biography']['publisher'] ?? 'Unknown',
      powerStats: PowerStats.fromJson(json['powerstats']),
    );
  }
}