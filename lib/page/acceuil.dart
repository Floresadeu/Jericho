import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jericho_plays/page/search_page.dart';

import 'favoris.dart';
import 'numero_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required paroles, required title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color bgColor = const Color(0xFF299417);
  int _selectedIndex = 0;
  final page = [
    const NumberSelectionPage(paroles: null, title: null, page: null,),
    FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF299417),
        title: Text(
          _selectedIndex == 0 ? 'JERICHO PLAY' : 'Favorite',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Ajoutez l'action que vous souhaitez ici
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bgColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
        ],
      ),
      body: page[_selectedIndex],
    );
  }

  @override
  void dispose() {
    super.dispose;
  }
}
