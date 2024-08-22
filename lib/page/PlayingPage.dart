import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'dialogue_taillePolice.dart'; 

class PlayingPage extends StatefulWidget {
  const PlayingPage({
    super.key,
    required this.paroles,
    required this.title,
    required this.sound,
  });

  final String paroles; 
  final String title; 
  final List<String> sound; // Liste des chemins d'accès aux fichiers audio associés

  @override
  State<PlayingPage> createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {
  Color bgColor = const Color(0xFF299417); // Couleur de fond de la page
  final player = AudioPlayer(); // Initialisation de l'objet AudioPlayer
  late String soundChosen; // Chemin du fichier audio choisi
  int currentVoiceIndex = 0; // Index de la voix sélectionnée

  StreamSubscription<Duration>? _positionSubscription; // Abonnement au flux de position de lecture
  StreamSubscription<Duration?>? _durationSubscription; // Abonnement au flux de durée de l'audio

  @override
  void initState() {
    super.initState();
    soundChosen = widget.sound.isNotEmpty ? widget.sound[currentVoiceIndex] : '';

    // Chargement de l'audio et gestion des erreurs éventuelles
    if (soundChosen.isNotEmpty) {
      _loadAudio();
    }

    // Abonnement pour mettre à jour la position de lecture
    _positionSubscription = player.positionStream.listen((p) {
      setState(() => position = p);
    });

    // Abonnement pour mettre à jour la durée de l'audio
    _durationSubscription = player.durationStream.listen((d) {
      setState(() => duration = d ?? Duration.zero);
    });
  }

  // Fonction pour charger l'audio
  void _loadAudio() async {
    try {
      await player.setAsset(soundChosen);
    } catch (e) {
      print("Erreur lors du chargement de l'audio: $e");
    }
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    player.dispose();
    super.dispose();
  }

  Duration position = Duration.zero; // Position actuelle de la lecture
  Duration duration = Duration.zero; // Durée totale de l'audio

  // Fonction pour formater la durée en minutes et secondes
  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  // Gestion de la lecture et pause de l'audio
  void handlePlayPause() {
    if (!player.playing) {
      player.play();
    } else {
      player.pause();
    }
  }

  // Activer la lecture en boucle
  void handleRepeat() {
    player.setLoopMode(LoopMode.one);
  }

  // Fonction pour déplacer la position de lecture
  void handleSeek(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }

  // Changer de voix et relire l'audio associé
  void selectVoice(int index) {
    setState(() {
      currentVoiceIndex = index;
      soundChosen = widget.sound[currentVoiceIndex];
      _loadAudio();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 110,
        child: BottomAppBar(
          color: bgColor,
          child: Column(
            children: [
              _jerichoPlayerBuilder(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.repeat_one_outlined, color: Colors.white),
                    onPressed: handleRepeat,
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_previous, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(player.playing ? Icons.pause : Icons.play_arrow, color: Colors.black),
                    onPressed: handlePlayPause,
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next, color: Colors.white),
                    onPressed: () {},
                  ),
                  PopupMenuButton<int>(
                    icon: const Icon(Icons.music_note_outlined, color: Colors.white),
                    onSelected: (index) {
                      selectVoice(index);
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 0, child: Text('Soprano')),
                      const PopupMenuItem(value: 1, child: Text('Alto')),
                      const PopupMenuItem(value: 2, child: Text('Tenor')),
                      const PopupMenuItem(value: 3,  child: Text('Basse')),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.text_fields, color: Colors.white),
            onPressed: () {
              ValueNotifier<double> fontSizeNotifier = ValueNotifier<double>(16.0);
              showTaillePoliceDialog(context, fontSizeNotifier);;
            },
          )
        ],
        backgroundColor: const Color(0xFF299417),
        title: Text(
          widget.title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.paroles, // Affichage des paroles du chant
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _jerichoPlayerBuilder(BuildContext context) {
    return Slider(
      min: 0.0,
      max: duration.inSeconds.toDouble(),
      value: position.inSeconds.toDouble().clamp(0.0, duration.inSeconds.toDouble()),
      onChanged: (value) => handleSeek(value),
      activeColor: Colors.white,
      inactiveColor: Colors.grey,
    );
  }
}
