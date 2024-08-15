import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VoixDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFEBF3EB),
      content: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(20), // Réduction de la taille de la boîte
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildVoixButton(context, 'Sopra'),
            const SizedBox(height: 5),
            _buildVoixButton(context, 'Alto'),
            const SizedBox(height: 5),
            _buildVoixButton(context, 'Tenor'),
            const SizedBox(height: 5),
            _buildVoixButton(context, 'Basse'),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('FERMER', style: TextStyle(color: Colors.black)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _buildVoixButton(BuildContext context, String voix) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF299417), // Vert
      ),
      onPressed: () {
        // Action à effectuer lorsqu'un bouton est cliqué
        Navigator.of(context).pop(voix);
      },
      child: Text(
        voix,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: const Color(0xFF000000), // Texte en noir
        ),
      ),
    );
  }
}

// Fonction pour afficher le dialogue
void showVoixDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return VoixDialog();
    },
  );
}
