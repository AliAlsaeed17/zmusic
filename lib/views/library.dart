//@dart=2.8
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';
import 'package:zmusic/constants.dart';
import 'package:zmusic/controllers/song_controller.dart';
import 'package:zmusic/views/now_playing.dart';
import 'package:zmusic/widgets/genre_card.dart';
import 'package:zmusic/widgets/song_card.dart';

class Library extends StatelessWidget {
  const Library({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "POPULAR",
                style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: kBlue,
                ),
              ),
            ),
            //Scroll view for different genres
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  //Call GenreCard
                  GenreCard(img: pop, title: "POP", foll: "40"),
                  GenreCard(img: hiphop, title: "HipHop", foll: "15"),
                  GenreCard(img: country, title: "Country", foll: "88"),
                  GenreCard(img: heavymetal, title: "Heavy Metal", foll: "88"),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, top: 20),
              child: Text(
                "TRENDING ALBUMS",
                style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: kBlue,
                ),
              ),
            ),
            //Container for Trending Songs
            Container(
              width: MediaQuery.of(context).size.width,
              height: 330,
              padding: EdgeInsets.fromLTRB(45, 30, 45, 25),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(scard)),
              ),
              child: SingleChildScrollView(
                child: GetBuilder<SongController>(
                  init: SongController(),
                  builder: (controller) {
                    return FutureBuilder(
                      future: controller.getSongs(),
                      builder: (context, snapshot) {
                        List<SongInfo> songs = snapshot.data;
                        if (!snapshot.hasData) return Text("LOADING ...");
                        return ListView.builder(
                          itemCount: songs.length,
                          itemBuilder: (context, songIndex) {
                            return SongCard(
                              song: songs[songIndex],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            //Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Image.asset(home, scale: 1.1),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const NowPlaying();
                    }));
                  },
                ),
                Image.asset(podcast, scale: 1.1),
                Image.asset(search, scale: 1.1),
                Image.asset(list, scale: 1.1),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.orange,
        onTap: (int index) {},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Email",
          ),
        ],
      ),
    );
  }
}
