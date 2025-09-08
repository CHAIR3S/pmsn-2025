import 'package:flutter/material.dart';
import '../models/game_hero.dart';
import '../widgets/item_row.dart';
import 'details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF4E342), Color(0xFFEE3474)],
          begin: Alignment(0.3, -1),
          end: Alignment(-0.8, 1),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 24),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemCount: demoHeroes.length,
            itemBuilder: (context, index) {
              final hero = demoHeroes[index];
              void goDetails() {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 450),
                    pageBuilder: (_, __, ___) => DetailsPage(hero: hero),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ItemRow(
                  hero: hero,
                  onSeeDetails: goDetails,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
