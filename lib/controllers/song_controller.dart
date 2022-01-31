//
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';

class SongController extends GetxController {
  FlutterAudioQuery query = FlutterAudioQuery();

  Future<List<SongInfo>> getSongs() async {
    List<SongInfo> songs =
        await query.getSongs(sortType: SongSortType.RECENT_YEAR);
    return songs;
    update();
  }
}
