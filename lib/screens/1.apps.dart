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
  int currentPageIndex = 0;
  void loadNextVideos() {
    // Determine the range of indices for the next 3 videos
    int startIndex = currentPageIndex + 1;
    int endIndex = currentPageIndex + 4; // Load the next 3 videos

    // Ensure endIndex does not exceed the length of the videoList
    endIndex = endIndex.clamp(0, videoList.length - 1);

    // Fetch and add the next videos to the list
    for (int i = startIndex; i <= endIndex; i++) {
      // Check if the video at index i is not already in the list
      if (!videoList.contains(videoList[i])) {
        // Fetch the video details and add it to the list
        VideoModel newVideo = VideoModel(
          caption: videoList[i].caption,
          date: videoList[i].date,
          video: videoList[i].video,
        );
        videoList.add(newVideo);
      }
    }

    // Update the state to trigger a rebuild
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        itemCount: videoList.length,
        scrollDirection: Axis.vertical,
        controller: PageController(viewportFraction: 1),
        onPageChanged: (int index) {
          // Update the current index when the page changes
          setState(() {
            currentPageIndex = index;
          });

          // Load the next 3 videos if available
          loadNextVideos();
        },
        itemBuilder: (BuildContext context, int itemIndex) {
          return VideoView(
            videoModel: videoList[itemIndex],
          );
        },
      ),
    );
  }
}
