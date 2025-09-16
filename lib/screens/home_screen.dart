// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:pmsn20252/utils/value_listener.dart';
import 'package:pmsn20252/pages/pokedex_home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedTab = _SelectedTab.home;

  final _pages = const [
    PokedexHomePage(),
    Center(child: Text('Favoritos')),
    Center(child: Text('Buscar')),
    Center(child: Text('Perfil')),
  ];

  void _handleIndexChanged(int i) {
    setState(() => _selectedTab = _SelectedTab.values[i]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Permite que el body se dibuje “debajo” del bar sin empujarlo
      extendBody: true,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          ValueListenableBuilder(
            valueListenable: ValueListener.isDark,
            builder: (context, value, child) {
              return value
                  ? IconButton(
                icon: const Icon(Icons.sunny),
                onPressed: () => ValueListener.isDark.value = false,
              )
                  : IconButton(
                icon: const Icon(Icons.nightlight),
                onPressed: () => ValueListener.isDark.value = true,
              );
            },
          ),
        ],
      ),

      drawer: const Drawer(),

      body: _pages[_SelectedTab.values.indexOf(_selectedTab)],

      // ⬇️ SIN SafeArea, SIN Padding, SIN SizedBox extra
      bottomNavigationBar: Builder(
        builder: (context) {
          final inset = MediaQuery.of(context).padding.bottom;
          // Si hay barra gestual, no añadimos margen abajo (el widget ya se ajusta)
          // Si NO hay inset, dejamos un respiro pequeño (8 px)
          final bottomMargin = inset > 0 ? 0.0 : 8.0;

          bottomNavigationBar: DotNavigationBar(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            dotIndicatorColor: Colors.white,
            unselectedItemColor: Colors.grey[300],
            splashBorderRadius: 50,
            onTap: _handleIndexChanged,
            items: [
              DotNavigationBarItem(
                icon: const Icon(Icons.home),
                selectedColor: const Color(0xff73544C),
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.favorite),
                selectedColor: const Color(0xff73544C),
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.search),
                selectedColor: const Color(0xff73544C),
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.person),
                selectedColor: const Color(0xff73544C),
              ),
            ],
          );
        },
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
