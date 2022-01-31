import 'package:flutter/material.dart';
import 'package:wave_progress_bars/wave_progress_bars.dart';
import 'package:zmusic/constants.dart';
import 'package:zmusic/views/library.dart';
import 'package:zmusic/widgets/navigation_button.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            //Navigation Buttons
            Row(
              children: [
                const SizedBox(width: 10.0),
                GestureDetector(
                  child: const SymbolButton(
                    symbol: back,
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const Library();
                    }));
                  },
                ),
                const Spacer(),
                const Text(
                  "NOW PLAYING",
                  style: TextStyle(
                    color: kBlue,
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Spacer(),
                const SymbolButton(
                  symbol: options,
                ),
                const SizedBox(width: 20.0),
              ],
            ),

            //Album Art Disk
            Container(
              padding: const EdgeInsets.all(50.0),
              height: 350.0,
              width: 350.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(disk),
                ),
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage(albumart),
                child: CircleAvatar(
                  backgroundColor: kWhite,
                  radius: 25,
                ),
              ),
            ),

            const SizedBox(height: 10.0),
            //Song title and Artist text
            const Text(
              "You Need to Calm Down",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w200,
              ),
            ),
            const SizedBox(height: 20.0),
            //Music Controllers
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                //Buttons called by passing its symbols
                SymbolButton(symbol: previous),
                SymbolButton(symbol: play),
                SymbolButton(symbol: next),
              ],
            ),
            const SizedBox(height: 20.0),
            //Wave Song Progrss Bar
            Center(
              child: WaveProgressBar(
                progressPercentage: 30,
                listOfHeights: values,
                width: 350,
                initalColor: kBlue.withAlpha(100),
                progressColor: kBlue,
                backgroundColor: kWhite,
                timeInMilliSeconds: 30,
                isHorizontallyAnimated: false,
                isVerticallyAnimated: false,
              ),
            ),
            const SizedBox(height: 10),
            //Song Time Stamp
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: kBlue.withAlpha(100),
                  fontWeight: FontWeight.bold,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: "0:54",
                    style: TextStyle(
                      color: kBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: "|"),
                  TextSpan(text: "3:54"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
