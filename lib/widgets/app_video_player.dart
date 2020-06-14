import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tiktok_clone/widgets/actions_toolbar.dart';
import 'package:tiktok_clone/widgets/video_description.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayer extends StatefulWidget {
  final String video;

  const AppVideoPlayer({
    Key key,
    @required this.video,
  }) : super(key: key);

  @override
  _AppVideoPlayerState createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  VideoPlayerController _controller;
  Size _screenSize;
  bool _tallPhone;
  bool _videoIsPotrait;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.video);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.setLooping(true);

    _controller.initialize().then(
          (_) => setState(
            () {
              setState(() {
                _screenSize = MediaQuery.of(context).size;
                _tallPhone = _screenSize.aspectRatio < 0.5 ? true : false;
                _videoIsPotrait =
                    _controller.value.aspectRatio < 1 ? true : false;
              });
              _controller.play();
            },
          ),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_tallPhone == null || _videoIsPotrait == null) {
      return Center(child: CircularProgressIndicator());
    }
    return _body();
  }

  _body() => Stack(
        children: <Widget>[
          _videoIsPotrait ? _potraitVideo() : _landscapeVideo(),
          // Body Top---------------------------------------------
          // Body Top---------------------------------------------
          // Body Top---------------------------------------------
          SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[VideoDescription(), ActionsToolbar()],
                  ),
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
          // End---------------------------------------------
          // End---------------------------------------------
          // End---------------------------------------------
        ],
      );

  get _video => Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          VideoPlayer(_controller),
          _PlayPauseOverlay(controller: _controller),
          VideoProgressIndicator(
            _controller,
            allowScrubbing: false,
            colors: VideoProgressColors(
              backgroundColor: Colors.transparent,
              playedColor: Colors.white30,
              bufferedColor: Colors.transparent,
            ),
          ),
        ],
      );

  _potraitVideo() {
    return SafeArea(bottom: _tallPhone, child: _video);
  }

  _landscapeVideo() {
    return SafeArea(
      child: Center(
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: _video,
        ),
      ),
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Color.fromARGB(80, 255, 255, 255),
                      size: 150.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
