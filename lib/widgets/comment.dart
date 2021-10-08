import 'package:flutter/material.dart';
import 'package:tiktok_ui/widgets/tiktok_icons.dart';

class CommentIcon extends StatelessWidget {
  const CommentIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 60,
      margin: EdgeInsets.only(top: 10.0, left: 10.0),
      // decoration: BoxDecoration(
      // image: DecorationImage(
      //   image: NetworkImage(
      //       "https://firebasestorage.googleapis.com/v0/b/trendy-10fe6.appspot.com/o/icons8-comment-64.png?alt=media&token=1606c872-211c-4c5d-b79e-e46e71bbb7bc"),
      // ),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(TikTokIcons.chat_bubble, color: Colors.white),
          Text(
            "23K",
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
