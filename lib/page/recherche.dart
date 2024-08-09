import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _songs = ['Chant 1', 'Chant 2', 'Chant 3', 'Chant 4'];
  List<String> _filteredSongs = [];

  @override
  void initState() {
    super.initState();
    _filteredSongs = _songs;
  }

  void _filterSongs(String query) {
    List<String> filteredList = _songs
        .where((song) => song.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _filteredSongs = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF3EB),
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
        title: TextField(
          controller: _searchController,
          onChanged: _filterSongs,
          decoration: InputDecoration(
            hintText: 'Rechercher un chant',
            hintStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xFF000000),
            ),
            border: InputBorder.none,
          ),
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xFF000000),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _filteredSongs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _filteredSongs[index],
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF000000),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF299417),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/favorites');
              },
              child: Image.network(
                'assets/images/recent_1.png',
                width: 33,
                height: 33,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/favorites');
              },
              child: Image.network(
                'assets/images/favori_1.png',
                width: 33,
                height: 33,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/favorites');
              },
              child: Image.network(
                'assets/images/numero_11.png',
                width: 33,
                height: 33,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
