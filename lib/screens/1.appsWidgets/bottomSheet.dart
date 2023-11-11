import 'package:flutter/material.dart';

import '../../models/comment.dart';
import 'commentWidget.dart';

void ShowCommentsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: FractionallySizedBox(
          heightFactor: 0.6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Stack(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 80),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: Samplecomments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: comment(
                              Samplecomments[index].commentText,
                              Samplecomments[index].date,
                              Samplecomments[index].username,
                              Samplecomments[index].time,
                              Samplecomments[index].profilePictureUrl,
                              context,
                              Samplecomments[index].reply,
                              true));
                    },
                  ),
                ),
                //Spacer(),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      //CommetTextField(context)
                      // ChangeNotifierProvider(
                      //   create: (context) => ViewController(),
                      //   child: CommentWithEmoji(),
                      // )
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Group 611.png',
                        width: 130,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}