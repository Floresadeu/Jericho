import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import "package:sqflite/sqlite_api.dart";
import 'page/plache_holder.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

final Future<Database> database = openDatabase(

  join(await getDatabasesPath(),
   'jericho_play_database.db'),

  onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
      'CREATE TABLE Chant(id INTEGER PRIMARY KEY, numPage int ,title TEXT, parole  Texte, voix1 Texte, voix2 Texte, voix3 Texte,voix4 Texte)',
    );
  },
  version: 1,
);
   


  runApp( MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final Future<Database> database;
  const MyApp({Key? Key, required this.database}) : super(key: Key);






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
