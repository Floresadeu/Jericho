import 'package:flutter/material.dart' show AppBar, AssetImage, BoxDecoration, BoxFit, BuildContext, Color, Container, DecorationImage, EdgeInsets, FontWeight, GestureDetector, Image, MainAxisAlignment, MaterialPageRoute, Navigator, Positioned, Row, Scaffold, SizedBox, Stack, StatelessWidget, Text, Widget;
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jericho_plays/page/recherche.dart'; 
import 'package:jericho_plays/page/favoris.dart';
import 'package:jericho_plays/page/dialogue_taillePolice.dart';

import 'dialogue_voix.dart';
import 'numero_Page.dart';




class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF3EB),
      appBar: AppBar(
        backgroundColor: Color(0xFF299417),
        title: Text(
          'JERICHO PLAY',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xFF000000),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/recherche_1.png',
                width: 33,
                height: 33,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showTaillePoliceDialog(context);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/police_de_caractere_1.png',
                width: 33,
                height: 33,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Image.asset(
              'assets/images/trois_points_1.png',
              width: 33,
              height: 34,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 120,
            right: 16,
            child: GestureDetector(
              onTap: () {
                showVoixDialog(context);  // Affiche la boîte de dialogue `dialogue_voix`
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/chanson_1.png'),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 8,
            right: 8,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFEBF3EB),
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 14),
                        child: Image.asset(
                          'assets/images/bouton_jouer_1.png',
                          width: 33,
                          height: 33,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/vectors/group_8_x2.svg',
                        width: 148,
                        height: 19,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '2:16 sec',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        color: const Color(0xFF000000),
                        width: 28,
                        height: 28,
                      ),
                    ],
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
                  Image.asset(
                    'assets/images/recent_1.png',
                    width: 33,
                    height: 33,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FavoritesPage()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/favori_1.png',
                      width: 33,
                      height: 33,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  NumberSelectionPage()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/numero_11.png',
                      width: 33,
                      height: 33,
                    ),
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
