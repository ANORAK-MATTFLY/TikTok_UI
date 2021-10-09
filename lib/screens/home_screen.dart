import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_ui/models/post-model.dart';
import 'package:tiktok_ui/widgets/add-icon.dart';
import 'package:tiktok_ui/widgets/tiktok_icons.dart';
import 'package:tiktok_ui/widgets/video-player.dart';

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

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(TikTokIcons.home),
            label: "home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
              icon: Icon(TikTokIcons.search), label: "home"),
          BottomNavigationBarItem(icon: UploadIcon(), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(TikTokIcons.messages), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(TikTokIcons.profile), label: "home")
        ],
      ),
      body: RotatedBox(
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
