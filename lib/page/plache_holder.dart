import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'acceuil.dart';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Utiliser Future.delayed pour retarder la navigation de 2 secondes
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFEBF3EB),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 228, 0, 356),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/music_logo_design_1.png'),
                ),
              ),
              width: 216,
              height: 216,
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'jericho_play_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE Chant(id INTEGER PRIMARY KEY, numPage int ,title TEXT, parole Texte, voix1 Texte, voix2 Texte, voix3 Texte, voix4 Texte)',
      );
    },
    version: 1,
  );

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final Future<Database> database;
  const MyApp({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
    );
  }
}
