import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF3EB),
      appBar: AppBar(
        backgroundColor: Color(0xFF299417),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Favoris',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
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
