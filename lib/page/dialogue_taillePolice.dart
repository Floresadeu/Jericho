import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaillePoliceDialog extends StatefulWidget {
  final ValueNotifier<double> fontSizeNotifier;

  TaillePoliceDialog({required this.fontSizeNotifier});

  @override
  _TaillePoliceDialogState createState() => _TaillePoliceDialogState();
}

class _TaillePoliceDialogState extends State<TaillePoliceDialog> {
  double _fontSize = 16.0; // Taille de police initiale

  @override
  void initState() {
    super.initState();
    _fontSize = widget.fontSizeNotifier.value; // Initialiser avec la taille actuelle
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFEBF3EB),
      content: Container(
        width: 260,
        height: 260,
        padding: const EdgeInsets.fromLTRB(0, 21, 14, 19.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Slider(
              value: _fontSize,
              min: 10,
              max: 40,
              divisions: 30,
              label: '${_fontSize.toStringAsFixed(1)}',
              onChanged: (double value) {
                setState(() {
                  _fontSize = value;
                  widget.fontSizeNotifier.value = value; // Mise à jour du ValueNotifier
                });
              },
            ),
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
              color: Colors.black,
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
void showTaillePoliceDialog(BuildContext context, ValueNotifier<double> fontSizeNotifier) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return TaillePoliceDialog(fontSizeNotifier: fontSizeNotifier);
    },
  );
}
