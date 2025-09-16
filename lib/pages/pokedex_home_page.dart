import 'package:flutter/material.dart';
import '../models/game_hero.dart';
import '../widgets/item_row.dart';
import 'pokedex_details_page.dart';

class PokedexHomePage extends StatelessWidget {
  const PokedexHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0EA5E9), Color(0xFF7C3AED)],
          begin: Alignment(0.3, -1), end: Alignment(-0.8, 1),
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: demoHeroes.length,
          itemBuilder: (context, i) {
            final hero = demoHeroes[i];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ItemRow(
                hero: hero,
                onSeeDetails: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 450),
                      pageBuilder: (_, __, ___) => PokedexDetailsPage(hero: hero),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
