import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;

class CommentTextField extends StatefulWidget {
  bool noBackground;
  CommentTextField({super.key, required this.noBackground});

  @override
  State<CommentTextField> createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;

// 1. Create GlobalKey for EmojiPickerState
  final key = GlobalKey<EmojiPickerState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: widget.noBackground ? Colors.transparent : Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25.0, top: 25, left: 20),
            child: Row(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/Ellipse 149.png'),
                  radius: 25,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFC4C4C4),
                      width: 0.5,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                child: SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              emojiShowing = !emojiShowing;
                            });
                          },
                          child: Image.asset(
                            'assets/Group.png', // Replace with the actual path to your book icon
                            height: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              hintText: 'Add Comment',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Color(0xFF5F6368),
                              ),
                            ),
                            style: const TextStyle(
                              color: Color(0xFF5C8DFF),
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/Vector (19).png', // Replace with the actual path to your book icon
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
        Offstage(
          offstage: !emojiShowing,
          child: SizedBox(
            height: widget.noBackground?800: 250,
            child: EmojiPicker(
              textEditingController: _controller,
              // onBackspacePressed: _onBackspacePressed,
              config: Config(
                columns: 7,
                // Issue: https://github.com/flutter/flutter/issues/28894
                emojiSizeMax: 32 *
                    (foundation.defaultTargetPlatform == TargetPlatform.iOS
                        ? 1.30
                        : 1.0),
                verticalSpacing: 0,
                horizontalSpacing: 0,
                gridPadding: EdgeInsets.zero,
                initCategory: Category.RECENT,
                bgColor: const Color(0xFFF2F2F2),
                indicatorColor: Colors.blue,
                iconColor: Colors.grey,
                iconColorSelected: Colors.blue,
                backspaceColor: Colors.blue,
                skinToneDialogBgColor: Colors.white,
                skinToneIndicatorColor: Colors.grey,
                enableSkinTones: true,
                recentTabBehavior: RecentTabBehavior.RECENT,
                recentsLimit: 28,
                replaceEmojiOnLimitExceed: false,
                noRecents: const Text(
                  'No Recents',
                  style: TextStyle(fontSize: 20, color: Colors.black26),
                  textAlign: TextAlign.center,
                ),
                loadingIndicator: const SizedBox.shrink(),
                tabIndicatorAnimDuration: kTabScrollDuration,
                categoryIcons: const CategoryIcons(),
                buttonMode: ButtonMode.MATERIAL,
                checkPlatformCompatibility: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
