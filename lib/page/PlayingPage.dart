import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import 'dialogue_taillePolice.dart';
import 'dialogue_voix.dart';

class PlayingPage extends StatefulWidget {
  const PlayingPage(
      {super.key,
      required this.paroles,
      required this.title,
      required this.sound});
  final String paroles;
  final String title;
  final List<String> sound;

  @override
  State<PlayingPage> createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {
  Color bgColor = const Color(0xFF299417);
  final player = AudioPlayer();
  late String soundChosen;

  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration?>? _durationSubscription;

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void handlePlayPause() {
    if (!player.playing) {
      player.play();
    } else {
      player.pause();
    }
  }

  void handleRepeat() {
    player.setLoopMode(LoopMode.one);
  }

  void handleSeek(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }

  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    soundChosen = widget.sound[0];
    print("Le son choisi est : $soundChosen");
    try {
      player.setAsset(soundChosen);
    } catch (e) {
      print("Erreur lors du chargement de l'audio: $e");
    }
    // Listen to position updates
    _positionSubscription = player.positionStream.listen((p) {
      setState(() => position = p);
    });

    // Listen to duration updates
    _durationSubscription = player.durationStream.listen((d) {
      setState(() => duration = d ?? Duration.zero);
    });
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    player.dispose();
    super.dispose();
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
              _jerichoPlayerBuilder(
                context,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.repeat_one_outlined,
                      color: Colors.white,
                    ),
                    onPressed: handleRepeat,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      player.playing ? Icons.pause : Icons.play_arrow,
                      color: Colors.black,
                    ),
                    onPressed: handlePlayPause,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.skip_next,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    onPressed: () {
                      showVoixDialog(context);
                    },
                    icon: const Icon(
                      Icons.music_note_outlined,
                      color: Colors.white,
                    ),
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
              showTaillePoliceDialog(context);
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
      body: Stack(children: [
        // Si les paroles sont présentes, les afficher
        SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Paroles: ${widget.paroles}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: const Color(0xFF000000),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _jerichoPlayerBuilder(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(formatDuration(position)),
        Expanded(
          child: Slider(
            value: position.inSeconds.toDouble(),
            onChanged: handleSeek,
            min: 0.0, // Valeur minimale
            max: duration.inSeconds.toDouble(),
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
          ),
        ),
        Text(formatDuration(duration)),
      ],
    );
  }
}
