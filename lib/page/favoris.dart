import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Aucun favoris',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w200,
          fontSize: 16,
          color: Color(0xFF000000),
        ),
      ),
    );
  }
}
