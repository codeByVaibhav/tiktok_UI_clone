import 'package:flutter/material.dart';
import 'package:tiktok_clone/widgets/app_video_player.dart';

class HomeScreen extends StatelessWidget {
  get _topSection => Container(
        height: 120.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Following'),
            Container(width: 15.0),
            Text(
              'For you',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            AppVideoPlayer(video: 'videos/1.mp4'),
            AppVideoPlayer(video: 'videos/kotaro.mp4'),
            AppVideoPlayer(video: 'videos/2.mp4'),
          ],
        ),
        _topSection,
      ],
    );
  }
}
