//@dart=2.8
import 'package:flutter/material.dart';
import 'package:zmusic/constants.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({
    Key key,
    this.img,
    this.title,
    this.foll,
  }) : super(key: key);

  final String img;
  final String title;
  final String foll;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(gcard)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(img),
            radius: 50,
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            "$foll Followers",
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
