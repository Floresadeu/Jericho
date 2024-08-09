import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaillePoliceDialog extends StatefulWidget {
  @override
  _TaillePoliceDialogState createState() => _TaillePoliceDialogState();
}

class _TaillePoliceDialogState extends State<TaillePoliceDialog> {
  double _fontSize = 16.0; // Taille de police initiale

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFEBF3EB),
      content: Container(
        width: 260, // Réduit la largeur du dialogue
        height: 260, // Réduit la hauteur du dialogue
        padding: const EdgeInsets.fromLTRB(0, 21, 14, 19.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Texte de titre
            Container(
              margin: EdgeInsets.fromLTRB(17.1, 0, 17.1, 46.4),
              child: Text(
                'Taille des caractères',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: _fontSize,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            // Barre de taille
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF299417),
                ),
                width: double.infinity,
                height: 5.9,
              ),
            ),
            // Slider pour ajuster la taille de la police
            Slider(
              value: _fontSize,
              min: 10,
              max: 40,
              divisions: 30,
              label: '${_fontSize.toStringAsFixed(1)}',
              onChanged: (double value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),
            // Bouton VALIDER
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'VALIDER',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text(
            'FERMER',
            style: TextStyle(
              color: Colors.black, // Couleur noire pour le bouton FERMER
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

// Fonction pour afficher le dialogue
void showTaillePoliceDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return TaillePoliceDialog();
    },
  );
}
