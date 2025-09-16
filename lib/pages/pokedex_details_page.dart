import 'package:flutter/material.dart';
import '../models/game_hero.dart';

class PokedexDetailsPage extends StatelessWidget {
  final GameHero hero;
  const PokedexDetailsPage({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0EA5E9), Color(0xFF7C3AED)],
            begin: Alignment(0.3, -1),
            end: Alignment(-0.8, 1),
          ),
        ),
        child: Stack(
          children: [
            // --- Contenido scrollable debajo de la barra ---
            SafeArea(
              top: false, // dejamos libre el top para la barra superpuesta
              child: ListView(
                padding: EdgeInsets.only(
                  top: 90, // espacio bajo la barra
                  bottom: 24 + MediaQuery.of(context).padding.bottom, // evita overflow inferior
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Hero(
                                  tag: 'hero-image-${hero.id}',
                                  child: Image.network(hero.imageUrl),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Text(
                          hero.name,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.1),
                            fontWeight: FontWeight.bold,
                            fontSize: 56,
                          ),
                        ),
                      ),
                      const SizedBox.shrink(),
                      Text(
                        hero.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 42,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Chip(
                      label: Text('Debilidad: ${hero.weakness}'),
                      backgroundColor: Colors.white24,
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
                    child: Text(
                      hero.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      const SizedBox(width: 28),
                      Expanded(
                        child: SizedBox(
                          height: 54,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Add to Roster',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: SizedBox(
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: Ink(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFF22D3EE), Color(0xFF6366F1)],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(80)),
                              ),
                              child: const Center(
                                child: Text('FIGHT!', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 28),
                    ],
                  ),
                  const SizedBox(height: 28),
                ],
              ),
            ),

            // --- Barra superior superpuesta (queda encima y capta taps) ---
            SafeArea(
              child: Row(
                children: [
                  const SizedBox(width: 18),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Text(
                    'Fighter Data',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 80,
                    height: 80,
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
