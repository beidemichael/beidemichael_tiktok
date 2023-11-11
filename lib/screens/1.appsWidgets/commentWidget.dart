import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

Widget comment(comment, name, username, time, profile, context, reply, icons) {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage(profile),
          radius: 25,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF000000),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  username,
                  style: const TextStyle(
                    color: Color(0xFF5C8DFF),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFFC4C4C4),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              comment,
              style: const TextStyle(
                color: Color(0xFF767676),
              ),
            ),
          ),
          icons
              ? Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => ChangeNotifierProvider(
                        //           create: (context) => ViewController(),
                        //           child: ReplyScreen()),
                        //     ));
                      },
                      child: Image.asset(
                        'assets/Profile.png', // Replace with the actual path to your book icon
                        height: 10,
                        width: 10,
                      ),
                    ),
                    // IconButton(
                    //   icon: Icon(Icons.comment,
                    //       color: AppTheme().commentIconColor),
                    //   onPressed: () {
                    //     // showBottomSheett(context);
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => ChangeNotifierProvider(
                    //               create: (context) => ViewController(),
                    //               child: ReplyScreen()),
                    //         ));
                    //   },
                    // ),
                     Image.asset(
                      'assets/Group 4261.png', // Replace with the actual path to your book icon
                      // height: 45,
                      width: 45,
                    ),
                    const SizedBox(width: 20),
                    Image.asset(
                      'assets/Group 4262.png', // Replace with the actual path to your book icon
                      // height: 45,
                      width: 45,
                    ),

                    const SizedBox(width: 20),
                      Image.asset(
                      'assets/Vector (18).png', // Replace with the actual path to your book icon
                      // height: 20,
                      width: 18,
                    ),
                  ],
                )
              : const SizedBox(),
          reply
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(2),
                    ),
                    color: Color(0xFFFAFAFA),
                    border: Border.all(color:Color(0xFFFEF1F1),width: 0.5)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal:5.0,vertical: 5),
                    child: Row(children: [
                      Text(
                        "View 15 replies",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF959595),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 11,
                        color:Color(0xFFBD6565),
                      )
                    ]),
                  ),
                )
              : const SizedBox()
        ],
      )
    ],
  ));
}
