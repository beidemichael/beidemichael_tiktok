import 'package:beidemichael_tiktok/components/loading.dart';
import 'package:beidemichael_tiktok/models/video.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

import '1.appsWidgets/video.dart';

class AppsPage extends StatefulWidget {
  AppsPage({super.key});

  @override
  State<AppsPage> createState() => _AppsPageState();
}

class _AppsPageState extends State<AppsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView.builder(
      itemCount: videoList.length,
      controller: PageController(viewportFraction: 1),
      itemBuilder: (BuildContext context, int itemIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: VideoView(
            videoModel: videoList[itemIndex],
          ),
        );
      },
    ));
  }
}
