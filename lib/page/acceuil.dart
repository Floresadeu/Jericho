import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jericho_plays/page/recherche.dart'; 
import 'package:jericho_plays/page/favoris.dart';
import 'package:jericho_plays/page/dialogue_taillePolice.dart';
import 'dialogue_voix.dart';
import 'numero_Page.dart';

class HomePage extends StatelessWidget {
  final String? paroles;  // Ajout de la variable pour stocker les paroles

  // Ajout d'un constructeur pour accepter les paroles
  HomePage({this.paroles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF3EB),
      appBar: AppBar(
        backgroundColor: Color(0xFF299417),
        title: Text(
          paroles != null ? 'Paroles du Chant' : 'JERICHO PLAY',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.text_fields, color: Colors.white),
            onPressed: () {
              showTaillePoliceDialog(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Ajoutez l'action que vous souhaitez ici
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          if (paroles != null)  // Si les paroles sont présentes, les afficher
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  paroles!,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            )
          else
            const Center(
              
            ),
          Positioned(
            bottom: 120,
            right: 16,
            child: GestureDetector(
              onTap: () {
                showVoixDialog(context);
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFF299417),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.music_note, size: 30, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 4,
            right: 4,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFEBF3EB),
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.fast_rewind, color: Colors.black),
                    onPressed: () {
                      // Logique pour reculer dans la lecture
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.play_arrow, color: Colors.black),
                    onPressed: () {
                      // code pour jouer ou mettre en pause
                    },
                  ),
                  Expanded(
                    child: Slider(
                      value: 0.3, // Position actuelle de lecture
                      onChanged: (newValue) {
                        // code pour mettre à jour la position de lecture
                      },
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.fast_forward, color: Colors.black),
                    onPressed: () {
                      // code pour avancer dans la lecture
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Color(0xFF299417),
              padding: EdgeInsets.symmetric(vertical: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.access_time, color: Colors.white, size: 33),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FavoritesPage()),
                      );
                    },
                    child: Icon(Icons.favorite, color: Colors.white, size: 33),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NumberSelectionPage()),
                      );
                    },
                    child: Icon(Icons.looks_one, color: Colors.white, size: 33),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
