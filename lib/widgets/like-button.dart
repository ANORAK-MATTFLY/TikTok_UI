import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:tiktok_ui/models/post-model.dart';

class LikeIcon extends StatefulWidget {
  final PostModel post;
  const LikeIcon({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  _LikeIconState createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  @override
  Widget build(BuildContext context) {
    Future<bool> onLikeButtonTapped(bool isLiked) async {
      /// send your request here

      /// if failed, you can do nothing

      return !isLiked;
    }

    return LikeButton(
      onTap: onLikeButtonTapped,
      size: 40.0,
      circleColor:
          CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite,
          color: isLiked ? Colors.red : Colors.white,
          size: 30.0,
        );
      },
      likeCount: widget.post.likes,
    );
  }
}
