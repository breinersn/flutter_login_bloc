import 'package:flutter/material.dart';
import 'package:flutter_login_bloc/models/youtube_video.dart';
import 'package:flutter_login_bloc/widgets/youtube_video_item.dart';

class NewVideos extends StatelessWidget {
  final List<YouTubeVideo> items;

  const NewVideos({required this.items}) : assert(items != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (index) {
        final YouTubeVideo item = items[index];
        return YouTubeVideoItem(
          item: item,
          onDismissed: () {},
        );
      }),
    );
  }
}
