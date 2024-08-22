import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jericho_plays/page/numero_Page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _jsonData = [];
  List<dynamic> _searchResults = []; // Liste pour stocker les résultats de recherche

  // Chargement des données JSON
  Future<void> _loadJsonData() async {
    final String jsonString = await rootBundle.loadString('assets/bd.json');
    setState(() {
      _jsonData = json.decode(jsonString);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  // Recherche des chants
  void _searchChants() {
    String searchText = _searchController.text.toLowerCase();
    final results = _jsonData.where((chant) {
      return chant['title'].toLowerCase().contains(searchText);
    }).toList();

    setState(() {
      _searchResults = results;
    });

    if (results.isEmpty) {
      // Si aucun chant n'est trouvé, affichez un message d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Chant non trouvé')),
      );
    }
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
        title: TextField(
          controller: _searchController,
          style: TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Rechercher un chant',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          onSubmitted: (_) => _searchChants(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () => _searchChants(),
          ),
        ],
      ),
      body: _searchResults.isEmpty
          ? Center(
              child: Text(
                'Recherchez un chant par titre',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Color(0xFF000000),
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final result = _searchResults[index];
                return ListTile(
                  title: Text(
                    result['title'],
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF000000),
                    ),
                  ),
                  subtitle: Text(
                    'Page: ${result['page']}', // Affichage du numéro de page
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Color(0xFF000000),
                    ),
                  ),
                  onTap: () {
                    // Rediriger vers la NumberSelectionPage avec les paroles, le titre et le numéro de page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NumberSelectionPage(
                          paroles: result['parole'],
                          title: result['title'],
                          page: result['page'], // Passe le numéro de page
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
