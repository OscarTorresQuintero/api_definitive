import 'package:flutter/material.dart';
import '../models/superhero_model.dart';
import '../services/superhero_service.dart';
import '../widgets/hero_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SuperheroService _service = SuperheroService();

  List<SuperheroModel> _heroes = [];
  List<SuperheroModel> _filteredHeroes = [];

  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadHeroes();
  }

  Future<void> _loadHeroes() async {
    try {
      final heroes = await _service.getHeroes();

      setState(() {
        _heroes = heroes;
        _filteredHeroes = heroes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error cargando héroes';
        _isLoading = false;
      });
    }
  }

  void _searchHero(String query) {
    final results = _heroes.where((hero) {
      final name = hero.name.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();

    setState(() {
      _filteredHeroes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚡ Heroes List'),
        backgroundColor: Colors.deepPurple,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: _searchHero,
              decoration: InputDecoration(
                hintText: 'Buscar héroe...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : SingleChildScrollView(
                  child: Padding(
  padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: _filteredHeroes.length,
                      itemBuilder: (context, index) {
                        return HeroCard(hero: _filteredHeroes[index]);
                      },
                    ),
                  ),
                ),
    );
  }
}


