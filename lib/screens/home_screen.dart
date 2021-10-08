import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tiktok_ui/models/post-model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_ui/widgets/comment.dart';
import 'package:tiktok_ui/widgets/like-button.dart';
// import 'package:trendy/features/discover/presentation/widgets/like_icon.dart';
// import 'package:trendy/features/timeline/infrastructur/models/post_model.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: posts.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  Widget getBody() {
    final viewSize = MediaQuery.of(context).size;

    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: tabController,
        children: List.generate(posts.length, (index) {
          return RotatedBox(
            quarterTurns: -1,
            child: VideoPlayerItem(
              viewSize: viewSize,
              post: posts[index],
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final Size viewSize;
  final PostModel post;

  const VideoPlayerItem({
    Key? key,
    required this.viewSize,
    required this.post,
  }) : super(key: key);

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem>
    with SingleTickerProviderStateMixin {
  VideoPlayerController? videoController;
  @override
  void initState() {
    super.initState();

    videoController = VideoPlayerController.network(widget.post.video!)
      ..setLooping(true)
      ..initialize().whenComplete(() {
        videoController!.setVolume(1);
        videoController!.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    videoController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          videoController!.value.isPlaying
              ? videoController!.pause()
              : videoController!.play();
        });
      },
      child: Container(
        width: widget.viewSize.width,
        height: widget.viewSize.height,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Stack(
                children: [
                  Center(
                    child: CupertinoActivityIndicator(
                      animating: true,
                      radius: 25,
                    ),
                  ),
                  // VideoPlayer(videoController!),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              width: widget.viewSize.width,
              height: widget.viewSize.height,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            color: Colors.red,
                            width: widget.viewSize.width - 10,
                            height: widget.viewSize.height,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      // color: Colors.blue,
                                      height: 200.0,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                              100),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: Container(
                                              height: 40.0,
                                              width: 40.0,
                                              margin: EdgeInsets.only(
                                                  top: 10.0, left: 10.0),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[50],
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(360),
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        360.0),
                                                child: Image.asset(
                                                    "assets/images/avatar.png"),
                                              ),
                                            ),
                                            title: Text(widget.post.ownerName!,
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            subtitle: Text("#dance #fyp #fy",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ),
                                          ListTile(
                                            leading: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              child: Lottie.asset(
                                                  'assets/lottie/vynile.json'),
                                            ),
                                            title: Text(
                                              "🎵 Justin Bieber - Changes",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  // width: 80,
                                  // color: Colors.blue,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CommentIcon(),
                                      LikeIcon(post: widget.post),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.share,
                                              color: Colors.white,
                                              size: 30.0,
                                            ),
                                          ),
                                          Text(
                                            "13.2K",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.0),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
