import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'textePage1.dart'; // Assurez-vous que ce fichier est importé

class NumberSelectionPage extends StatelessWidget {
  void onNumberTap(BuildContext context, int number) {
    if (number == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TextePage1()), // Naviguer vers TextePage1
      );
    } else {
      print('Numéro $number cliqué');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF3EB),
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
          'Sélectionner un numéro de page',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xFF000000),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(20, (rowIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0), // Espacement vertical entre les lignes
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (colIndex) {
                  int number = rowIndex * 5 + colIndex + 1;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0), // Espacement horizontal entre les colonnes
                    child: GestureDetector(
                      onTap: () {
                        onNumberTap(context, number); // Appeler la méthode pour gérer le clic
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 50, // Largeur de chaque cellule
                        height: 50, // Hauteur de chaque cellule
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xFF299417), width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '$number',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 18, // Taille du texte agrandie
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ),
      ),
    );
  }
}
