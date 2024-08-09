import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF3EB),
      appBar: AppBar(
        backgroundColor: Color(0xFF299417),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/images/fleche_gauche_11.png',
            width: 33,
            height: 33,
          ),
        ),
        title: Text(
          'Favoris',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xFF000000),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Aucun favoris',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w200,
            fontSize: 16,
            color: Color(0xFF000000),
          ),
        ),
      ),
    );
  }
}
