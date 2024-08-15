import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jericho_plays/page/PlayingPage.dart';

class NumberSelectionPage extends StatefulWidget {
  const NumberSelectionPage({super.key});

  @override
  State<NumberSelectionPage> createState() => _NumberSelectionPageState();
}

class _NumberSelectionPageState extends State<NumberSelectionPage> {
  late List<dynamic> jsonData = [];
  List<String> titles = [];

  Future<void> _loadJsonData() async {
    final String jsonString = await rootBundle.loadString('assets/bd.json');
    final List<dynamic> data = json.decode(jsonString);
    setState(() {
      jsonData = data;
    });
  }

  @override
  void initState() {
    _loadJsonData();
    super.initState();
  }

  String getParole(String title) {
    return jsonData
        .where((_element) => _element['title'] == title)
        .first['parole'];
  }

  List<String> getSoundPath(String title) {
    return (jsonData
            .where((_element) => _element['title'] == title)
            .first['voices_path'] as List<dynamic>)
        .cast<String>()
        .toList();
  }

  void showTitleDialog(BuildContext context, List<String> titles) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Titres de Chants',
              style: GoogleFonts.inter(color: Colors.black)),
          content: Container(
            width: 400, // Largeur fixe de la boîte de dialogue
            height: 350, // Hauteur fixe de la boîte de dialogue
            child: ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(titles[index],
                      style: GoogleFonts.inter(color: Colors.black)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (context) => PlayingPage(
                                  title: titles[index],
                                  paroles: getParole(titles[index]),
                                  sound: getSoundPath(titles[index]),
                                )));
                  },
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:
                  Text('Fermer', style: GoogleFonts.inter(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<String> musicListByPage(int pageNumber) {
    List<String> titles = [];
    for (Map<String, dynamic> data in jsonData) {
      if (pageNumber == data['page']) {
        titles.add(data['title']);
        print("NOUVEAU TITRE: $titles");
      }
    }

    return titles;
  }

  void onNumberTap(BuildContext context, int number) {
    titles = musicListByPage(number);

    showTitleDialog(context,
        titles); // Affiche la boîte de dialogue avec la liste des titres
  }

  @override
  Widget build(BuildContext context) {
    int counter = jsonData.where((elt) {
      List<int> pagesList = [];
      if (!pagesList.contains(elt['page'])) {
        return true;
      } else {
        pagesList.add(elt['page']);
        return false;
      }
    }).length;
    return SingleChildScrollView(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 8.0,
        runSpacing: 4.0,
        children: List.generate(counter, (index) {
          int number = index + 1;
          return GestureDetector(
            onTap: () {
              onNumberTap(context, number);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF299417), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$number',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: const Color(0xFF000000),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
