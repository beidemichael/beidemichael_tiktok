import 'package:flutter/material.dart';

import '../../../models/comment.dart';
import '../commentWidget.dart';
import '../customTextField.dart';

class ReplyPage extends StatefulWidget {
  Comment comment;
  ReplyPage({super.key, required this.comment});

  @override
  State<ReplyPage> createState() => _ReplyPageState();
}

class _ReplyPageState extends State<ReplyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Reply',
          style: TextStyle(
            color: Color(0xFF000000),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 52,
              top: 10,
              child: Container(
                color: Color(0xFF886826),
                height: 180,
                width: 2,
              ),
            ),
            ListView(
              shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: commentName(
                    widget.comment.commentText,
                    widget.comment.date,
                    widget.comment.username,
                    widget.comment.time,
                    widget.comment.profilePictureUrl,
                    context,
                    false,
                    false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Replying to",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        " John Doe " + widget.comment.username,
                        style: TextStyle(
                            color: Color(0xFFFFBB00),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                CommentTextField(
                  noBackground: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
