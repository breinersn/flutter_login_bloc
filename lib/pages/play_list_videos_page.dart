import 'package:flutter/material.dart';
import 'package:flutter_login_bloc/api/youtobe_api.dart';
import 'package:flutter_login_bloc/models/youtube_video.dart';
import 'package:flutter_login_bloc/widgets/my_appbar.dart';
import 'package:flutter_login_bloc/widgets/video_item_shimmer.dart';
import 'package:flutter_login_bloc/widgets/youtube_video_item.dart';

class PlayListVideosPage extends StatefulWidget {
  final String playListId;

  const PlayListVideosPage({super.key, required this.playListId});
  @override
  _PlayListVideosPageState createState() => _PlayListVideosPageState();
}

class _PlayListVideosPageState extends State<PlayListVideosPage> {
  List<YouTubeVideo> _videos = [];
  bool _loading = true;
  YouTubeAPI _youTubeAPI =
      YouTubeAPI(apiKey: "AIzaSyAUOpSlooSVnbdHiZ5bDvg9LE-B5lEstGE");

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    final List<YouTubeVideo> videos =
        await _youTubeAPI.getPlayListVideos(widget.playListId);

    setState(() {
      _loading = false;
      _videos.addAll(videos);
    });
  }

  Widget _shimmer() {
    return ListView.builder(
      itemBuilder: (_, index) {
        return VideoItemShimmer();
      },
      itemCount: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            MyAppbar(
              leftIcon: 'assets/icons/back.svg',
              rightIcon: 'assets/icons/chat.svg',
              onLeftClick: () => Navigator.pop(context),
              onRightClick: () {},
            ),
            Expanded(
                child: _loading
                    ? _shimmer()
                    : ListView.builder(
                        itemBuilder: (_, index) {
                          final YouTubeVideo item = _videos[index];
                          return YouTubeVideoItem(
                            item: item,
                            onDismissed: () {},
                          );
                        },
                        itemCount: _videos.length,
                      ))
          ],
        ),
      )),
    );
  }
}
