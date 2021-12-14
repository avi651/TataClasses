import 'package:video_player/video_player.dart';

class Singleton {
  static final Singleton _singleton = new Singleton._internal();
  Singleton._internal();
  static Singleton get instance => _singleton;
  VideoPlayerController videoPlayerController1;
}
