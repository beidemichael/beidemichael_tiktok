import 'package:flutter/material.dart';

void showFloatingDrawerAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned(
            top: -25,
            left: -40,
            child: AlertDialog(
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.none,
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 30),
                child: Column(
                  children: [
                    nameRow('assets/Vector (12).png', 'Post a Seequl',
                        Color(0xFF534D4D)),
                    nameRow('assets/Vector (13).png', 'View your likes',
                        Color(0xFF534D4D)),
                    nameRow('assets/Vector (14).png', 'Your Seequl posts',
                        Color(0xFF534D4D)),
                    nameRow('assets/Group 614.png', 'Reference contribution',
                        Color(0xFF534D4D)),
                    nameRow('assets/Vector (15).png', 'Hashtag challenges',
                        Color(0xFF534D4D)),
                    nameRow('assets/Vector (16).png', 'Notifications',
                        Color(0xFF534D4D)),
                    nameRow('assets/Vector (17).png', 'About SeeQul',
                        Color(0xFF534D4D)),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget nameRow(String image, String text, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
    child: Row(
      children: [
        Image.asset(
          image,
          width: 30,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
          ),
        ),
      ],
    ),
  );
}
