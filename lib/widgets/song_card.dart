//@dart=2.8
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:zmusic/models/song_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    Key key,
    this.song,
  }) : super(key: key);

  final SongInfo song;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${song.id}"),
              const SizedBox(width: 20),
              CircleAvatar(
                backgroundImage: AssetImage(""),
                radius: 30,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    song.artist,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                parseToMsInSec(int.parse(song.duration)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String parseToMsInSec(int ms) {
    String data;
    Duration duration = Duration(milliseconds: ms);
    int min = duration.inMinutes;
    int sec = duration.inSeconds;
    data = min.toString() + "0";
    if (sec <= 9) data += "0";
    data += sec.toString();
    return data;
  }
}
