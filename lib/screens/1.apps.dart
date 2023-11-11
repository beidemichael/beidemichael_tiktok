import 'package:beidemichael_tiktok/models/video.dart';
import 'package:beidemichael_tiktok/provider/viewProvider.dart';
import 'package:beidemichael_tiktok/screens/1.appsWidgets/floatingDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '1.appsWidgets/bottomSheet.dart';
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
                top: 70,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    showFloatingDrawerAlertDialog(context);
                  },
                  child: Image.asset(
                    'assets/Group 4244.png',
                    width: 50,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Visibility(
                  visible: viewProvider.fullScreen,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.78,
                    decoration: BoxDecoration(
                      color: Color(0xFF4C4243).withOpacity(0.5),
                      border: Border.all(color: Colors.white, width: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Visibility(
                              visible: viewProvider.fullCaption,
                              child: GestureDetector(
                                onTap: () {
                                  viewProvider.fullHeightCaption();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20.0,
                                    top: 10,
                                  ),
                                  child: Image.asset(
                                    'assets/Group 4236 (1).png',
                                    width: 70,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Text(
                            videoList[itemIndex].caption,
                            overflow: viewProvider.fullCaption
                                ? null
                                : TextOverflow.ellipsis,
                            maxLines: viewProvider.fullCaption ? null : 4,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 10),
                              child: Text(
                                videoList[itemIndex].date,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 181, 121, 121),
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Visibility(
                              visible: !viewProvider.fullCaption,
                              child: GestureDetector(
                                onTap: () {
                                  viewProvider.fullHeightCaption();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20.0,
                                    bottom: 4,
                                  ),
                                  child: Image.asset(
                                    'assets/Group 4236.png',
                                    width: 70,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
                      GestureDetector(
                        onTap: (){
                          ShowCommentsBottomSheet(context);
                        },
                        child: Image.asset(
                          'assets/Group 613.png',
                          width: 45,
                          height: 45,
                        ),
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
