import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberSelectionPage extends StatelessWidget {
  void showTitleDialog(BuildContext context, List<String> titles) {
     showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Titres de Chants', style: GoogleFonts.inter(color: Colors.black)),
        content: Container(
          width: 400, // Largeur fixe de la boîte de dialogue
          height: 350, // Hauteur fixe de la boîte de dialogue
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
                return ListTile(
                  title: Text(titles[index], style: GoogleFonts.inter(color: Colors.black)),
                  onTap: () {
                    Navigator.pop(context);
                    // Logique pour afficher les paroles du chant
                    // Exemple: Navigator.push(context, MaterialPageRoute(builder: (context) => ChantPage(titre: titles[index])));
                  },
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Fermer', style: GoogleFonts.inter(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onNumberTap(BuildContext context, int number) {
   //logique pour la récupération des titres de chants en fonction du numéro de page
    List<String> titles = [];
    if (number == 1 || number == 3  || number == 4 || number == 5  || number == 6  || number == 7 || number == 8 || number == 9  || number == 10 || number == 11 || number == 12) {
      titles = ['Chant 1', 'Chant 2', 'Chant 3', 'Chant 4', 'Chant 5',];
    } else if (number == 2 || number == 13 || number == 14 || number == 14 || number == 16 || number == 17 || number == 18|| number == 19 || number == 20 || number == 21 || number == 22) {
      titles = ['Chant 1', 'Chant 2', 'Chant 4', 'Chant 4', 'Chant 5',];
    } // Ajoutez des conditions pour d'autres numéros de page

    showTitleDialog(context, titles); // Affiche la boîte de dialogue avec la liste des titres
  }

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
          'Sélectionner un numéro de page',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
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
