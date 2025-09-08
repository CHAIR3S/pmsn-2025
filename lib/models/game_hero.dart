class GameHero {
  final String id;
  final String name;
  final String imageUrl;
  final double energy;     // energía (rayito)
  final double attack;     // espada
  final String weakness;   // debilidad elemental
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

// Imágenes de PokeAPI (official-artwork)
const _art = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork';

const demoHeroes = <GameHero>[
  GameHero(
    id: '025',
    name: 'Pikachu',
    imageUrl: '$_art/25.png',
    energy: 92,
    attack: 70,
    weakness: 'Tierra',
    description: 'Almacena electricidad y la libera en descargas potentes.',
  ),
  GameHero(
    id: '007',
    name: 'Squirtle',
    imageUrl: '$_art/7.png',
    energy: 60,
    attack: 62,
    weakness: 'Eléctrico',
    description: 'Tortuguita acuática. Dispara agua a presión desde su caparazón y resiste en combate.',
  ),
  GameHero(
    id: '004',
    name: 'Charmander',
    imageUrl: '$_art/4.png',
    energy: 68,
    attack: 74,
    weakness: 'Agua',
    description: 'Lagarto de fuego. La llama de su cola indica su energía; si arde, está listo para pelear.',
  ),
  GameHero(
    id: '001',
    name: 'Bulbasaur',
    imageUrl: '$_art/1.png',
    energy: 65,
    attack: 66,
    weakness: 'Fuego',
    description: 'Semilla planta. Absorbe energía solar con el bulbo de su espalda para fortalecerse.',
  ),
  GameHero(
    id: '074',
    name: 'Geodude',
    imageUrl: '$_art/74.png',
    energy: 40,
    attack: 70,
    weakness: 'Agua',
    description: 'Roca viviente. Muy duro y pesado; pero le cuestan los ataques de agua.',
  ),
  GameHero(
    id: '027',
    name: 'Sandshrew',
    imageUrl: '$_art/27.png',
    energy: 58,
    attack: 64,
    weakness: 'Agua',
    description: 'Topo arenoso. Se enrolla para protegerse; excelente contra eléctricos, débil al agua.',
  )
];
