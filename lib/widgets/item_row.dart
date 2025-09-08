import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../models/game_hero.dart';
import 'attribute_widget.dart';

double radians(double deg) => deg * math.pi / 180.0;

// Íconos (del tutorial) para energía y espada
const speedIcon = 'https://flutter4fun.com/wp-content/uploads/2020/11/speed.png';
const knifeIcon = 'https://flutter4fun.com/wp-content/uploads/2020/11/knife.png';

class ItemRow extends StatelessWidget {
  final GameHero hero;
  final double rowHeight;
  final VoidCallback onSeeDetails;

  const ItemRow({
    super.key,
    required this.hero,
    required this.onSeeDetails,
    this.rowHeight = 180,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onSeeDetails, // tap en toda la tarjeta
        child: SizedBox(
          height: rowHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Capa translúcida 1
              Transform.translate(
                offset: const Offset(-10, 0),
                child: Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.01)
                    ..rotateY(radians(1.5)),
                  child: Container(
                    height: 216,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(22)),
                    ),
                  ),
                ),
              ),
              // Capa translúcida 2
              Transform.translate(
                offset: const Offset(-44, 0),
                child: Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.01)
                    ..rotateY(radians(8)),
                  child: Container(
                    height: 188,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: const BorderRadius.all(Radius.circular(22)),
                    ),
                  ),
                ),
              ),

              // Imagen del héroe (Hero)
              Align(
                alignment: Alignment.centerLeft,
                child: Transform.translate(
                  offset: const Offset(-30, 0),
                  child: Hero(
                    tag: 'hero-image-${hero.id}',
                    child: Image.network(
                      hero.imageUrl,
                      width: rowHeight,
                      height: rowHeight,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Atributos + botón (SIN overflow)
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 48),
                  child: SizedBox(
                    height: rowHeight - 24, // limita altura disponible
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AttributeWidget(
                              progress: hero.energy,
                              child: Image.network(speedIcon),
                            ),
                            const SizedBox(width: 12),
                            AttributeWidget(
                              progress: hero.attack,
                              child: Image.network(knifeIcon),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 34,
                          child: OutlinedButton(
                            onPressed: onSeeDetails,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white, width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(fontSize: 12),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                            ),
                            child: const Text('See Details'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
