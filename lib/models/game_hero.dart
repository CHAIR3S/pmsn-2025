class GameHero {
  final int id;
  final String name;
  final String imageUrl;
  final double energy;   // 0..100
  final double attack;   // 0..100
  final String weakness; // Agua, Tierra, etc.
  final String description;

  const GameHero({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.energy,
    required this.attack,
    required this.weakness,
    required this.description,
  });
}

// Demo: imágenes oficiales de PokeAPI (solo URLs).
const _art = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork';

const demoHeroes = <GameHero>[
  GameHero(
    id: 25,
    name: 'Pikachu',
    imageUrl: '$_art/25.png',
    energy: 86,
    attack: 72,
    weakness: 'Tierra',
    description: 'Pokémon de tipo eléctrico, veloz y carismático. Canaliza energía en sus mejillas.',
  ),
  GameHero(
    id: 7,
    name: 'Squirtle',
    imageUrl: '$_art/7.png',
    energy: 70,
    attack: 60,
    weakness: 'Planta / Eléctrico',
    description: 'Caparazón resistente y disparos de agua a presión. Ideal para aguantar daño.',
  ),
  GameHero(
    id: 4,
    name: 'Charmander',
    imageUrl: '$_art/4.png',
    energy: 75,
    attack: 78,
    weakness: 'Agua / Roca',
    description: 'Su cola arde con intensidad. Cuanto mayor la llama, más fuerte el ánimo.',
  ),
  GameHero(
    id: 1,
    name: 'Bulbasaur',
    imageUrl: '$_art/1.png',
    energy: 68,
    attack: 65,
    weakness: 'Fuego / Hielo',
    description: 'Brota energía de la semilla de su lomo. Muy balanceado en combate.',
  ),
];
