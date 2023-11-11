import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

import '../../components/loading.dart';
import '../../models/video.dart';

class VideoView extends StatefulWidget {
  VideoModel videoModel;
   VideoView({super.key, required this.videoModel});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController videoPlayerController;
  bool playing = true;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoModel.video))
          ..initialize().then((value) => {setState(() {})});
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.0);
    videoPlayerController.play();
  }

  pausePlayVideo() {
    setState(() {
      playing ? videoPlayerController.pause() : videoPlayerController.play();
      playing = !playing;
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: videoPlayerController.value.isInitialized
          ? GestureDetector(
              onTap: () {
                pausePlayVideo();
              },
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: videoPlayerController.value.size?.width ?? 0,
                        height: videoPlayerController.value.size?.height ?? 0,
                        child: VideoPlayer(videoPlayerController),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: !playing
                          ? const Icon(
                              FontAwesomeIcons.play,
                              color: Colors.white,
                              size: 50,
                            )
                          : Container(),
                    ),
                  ),
                ],
              ))
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Loading()),
    );
  }
}
