import 'package:flutter/material.dart';
import '../models/game_hero.dart';
import '../widgets/item_row.dart';
import 'details_page.dart';
import '../theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppTheme.bgGradient,
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
