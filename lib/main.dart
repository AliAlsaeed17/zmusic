import 'package:audio_manager/audio_manager.dart';
import 'package:flutter/material.dart';
import 'package:zmusic/views/now_playing.dart';

void main() {
  var audioManager = AudioManager.instance;
  bool showVol = false;
  PlayMode playMode = audioManager.playMode;
  bool isPlaying = false;
  double _slide;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "ZMusic App",
      debugShowCheckedModeBanner: false,
      home: NowPlaying(),
    );
  }
}
