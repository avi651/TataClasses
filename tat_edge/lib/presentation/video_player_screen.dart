import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tat_edge/singleton.dart';
import 'package:tat_edge/widgets/wid_show_dialog.dart';
import 'package:video_player/video_player.dart';

import 'home.dart';

class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.title = 'Video '});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;

  ChewieController _chewieController;
  bool _isPlaying;
  var s1 = Singleton.instance;

  void checkVideo() {
    // Implement your calls inside these conditions' bodies :
    if (s1.videoPlayerController1.value.position ==
        Duration(seconds: 0, minutes: 0, hours: 0)) {
      print('video Started');
    }

    if (s1.videoPlayerController1.value.position ==
        s1.videoPlayerController1.value.duration) {
      print('video Ended');
    }
  }

  @override
  void initState() {
    super.initState();
    _isPlaying = true;

    s1.videoPlayerController1 = VideoPlayerController.network(
        'https://media.w3.org/2010/05/sintel/trailer.mp4');

    _chewieController = ChewieController(
      videoPlayerController: s1.videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
    );

    s1.videoPlayerController1.addListener(() async {
      int seconds = s1.videoPlayerController1.value.position.inSeconds;

      final duration = await s1.videoPlayerController1.position;

      /// check if video has ended
      if (duration.inSeconds ==
          s1.videoPlayerController1.value.duration.inSeconds) {
        /// restart the video by setting current position to 0
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Home()));
      } else {}

      if (seconds == 5 && _isPlaying == true) {
        print('The seconds is 5');
        print(seconds);
        setState(() {
          // If the video is playing, pause it.
          if (s1.videoPlayerController1.value.isPlaying) {
            s1.videoPlayerController1.pause();
            _isPlaying = false;
            showDialog(
              context: context,
              builder: (_) => const WidShowDialog(),
            ).then((exit) {
              if (exit == null) return;

              if (exit) {
                // user pressed Yes button

                s1.videoPlayerController1.play();
              } else {
                // user pressed No button
              }
            });
          } else {
            // If the video is paused, play it_videoPlayerController1.play();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Chewie(
                controller: _chewieController,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _chewieController.dispose();

                      _chewieController = ChewieController(
                        videoPlayerController: s1.videoPlayerController1,
                        aspectRatio: 3 / 2,
                        autoPlay: true,
                        looping: true,
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    s1.videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
