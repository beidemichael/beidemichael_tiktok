import 'package:beidemichael_tiktok/components/loading.dart';
import 'package:beidemichael_tiktok/models/video.dart';
import 'package:beidemichael_tiktok/provider/viewProvider.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';
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
    final viewProvider = Provider.of<ViewProvider>(context);
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
          return Stack(
            children: [
              VideoView(
                videoModel: videoList[itemIndex],
              ),
              Positioned(
                bottom: 10,
                right: viewProvider.fullScreen ? -6 : null,
                left: viewProvider.fullScreen ? null : -6,
                child: GestureDetector(
                  onTap: () {
                    viewProvider.fullScreenFunction();
                  },
                  child: viewProvider.fullScreen
                      ? Image.asset(
                          'assets/Group 4238.png',
                          width: 70,
                          height: 70,
                        )
                      : Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                          child: Image.asset(
                            'assets/Group 4238.png',
                            width: 70,
                            height: 70,
                          ),
                        ),
                ),
              ),
              Positioned(
                bottom: 30,
                right: 7,
                child: Visibility(
                  visible: viewProvider.fullScreen,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/Ellipse 48.png',
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/Group 602.png',
                        width: 34,
                        height: 34,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/Group 613.png',
                        width: 45,
                        height: 45,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/Group 612.png',
                        width: 45,
                        height: 45,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/Vector (11).png',
                        width: 27,
                        height: 27,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
