import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'acceuil.dart';
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  Future<void> _searchChants(BuildContext context) async {
    Database db = await getDatabase();

    String searchText = _searchController.text;
    List<Map<String, dynamic>> results = await db.query(
      'chant',
      where: 'titre LIKE ?',
      whereArgs: ['%$searchText%'],
    );

    if (results.isNotEmpty) {
      // Si un chant est trouvé, affichez les paroles dans `acceuil.dart`
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>HomePage (paroles: results[0]['parole']),
        ),
      );
    } else {
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
          onSubmitted: (_) => _searchChants(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () => _searchChants(context),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Recherchez un chant par titre',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: Color(0xFF000000),
          ),
        ),
      ),
    );
  }
  
  getDatabase() {}

}
