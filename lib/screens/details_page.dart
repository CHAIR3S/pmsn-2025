import 'package:flutter/material.dart';
import '../models/game_hero.dart';

class DetailsPage extends StatelessWidget {
  final GameHero hero;
  const DetailsPage({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    const appBarHeight = 80.0;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF4E342), Color(0xFFEE3474)],
            begin: Alignment(0.3, -1),
            end: Alignment(-0.8, 1),
          ),
        ),
        child: Stack(
          children: [
            SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 18),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Text(
                    'Overview',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Expanded(child: SizedBox(height: 80)),
                  const SizedBox(width: 80, height: 80, child: Icon(Icons.menu, color: Colors.white)),
                ],
              ),
            ),

            ListView(
              padding: const EdgeInsets.only(top: appBarHeight),
              children: [
                _HeroDetailsImage(hero.imageUrl, hero.id),
                _HeroDetailsName(hero.name),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Text(
                        'Debilidad: ${hero.weakness}',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
                  child: Text(
                    hero.description,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
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
                            side: const BorderSide(color: Colors.white, width: 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 12),
                          ),
                          child: const Text('Add to Roster'),
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
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                          ),
                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFF29758), Color(0xFFEF5D67)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                              alignment: Alignment.center,
                              child: const Text('Fight!', style: TextStyle(color: Colors.white)),
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
          ],
        ),
      ),
    );
  }
}

class _HeroDetailsImage extends StatelessWidget {
  final String url;
  final String id;
  const _HeroDetailsImage(this.url, this.id);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(28)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(28)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(28)),
                ),
                child: const SizedBox.expand(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Hero(
                      tag: 'hero-image-$id',
                      child: Image.network(url),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroDetailsName extends StatelessWidget {
  final String heroName;
  const _HeroDetailsName(this.heroName);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            heroName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 42,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(
              heroName,
              style: TextStyle(
                color: Colors.white.withOpacity(0.1),
                fontWeight: FontWeight.bold,
                fontSize: 56,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
