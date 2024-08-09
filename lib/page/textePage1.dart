import 'package:flutter/material.dart';

class TextePage1 extends StatelessWidget {
  const TextePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF299417), // Couleur verte
        title: const Text(
          "L'AMOUR A FAIT LES PREMIERS PAS",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            '''
CHANT : L'AMOUR A FAIT LES PREMIERS PAS

SOLO1(soprano+alto) : L'amour a fait les premiers pas ; l'amour a préparé la noce ; les invités ne viennent pas ; l'amour a fait les premiers pas.

CHOEUR : Les places vides sont offertes, à ceux que l'on n'attendait pas, l'amour a fait les premiers pas ; il nous adresse la parole il nous invite à son repas l'amour a fait les premiers pas ; l'amour a fait les premiers pas.

SOLO2 : L'amour a pris la liberté, de négliger les convenances ; il s'est chargé de l'étranger, l'amour a pris la liberté.

CHOEUR : il laisse les brebis fidèles, pour celles qui sont égarées, l'amour a pris la liberté ; il attendait l'enfant prodigue, il nous invite à le fêter l'amour a pris la liberté l'amour a pris la liberté.

SOLO3 : L'amour efface le passé, personne n'osa jeter la pierre ; et tous les yeux se sont baissés, l'amour efface le passé.

CHOEUR : il a vu l'homme dans sa lèpre, il n'a pas peur de l'embrasser, l'amour efface le passé ; il nous redonne une autre chance, il nous invite à pardonner, l'amour efface le passé, l'amour efface le passé.

SOLO4 : L'amour annonce l'avenir, il fait renaître de la cendre : la flamme qui allait mourir, l'amour annonce l'avenir.

CHOEUR : il donne jour à l'espérance, il fait renaître le désir, l'amour annonce l'avenir ; il nous redonne sa confiance, il nous invite à repartir ; l'amour annonce l'avenir, l'amour annonce l'avenir.
            ''',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
