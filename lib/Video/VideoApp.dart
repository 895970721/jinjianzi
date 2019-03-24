import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';


class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State <VideoApp> {
    VideoPlayerController _controller;
    bool _isPlaying = false;
    String url = 'https://vd2.bdstatic.com/mda-jcnh23b2nbsgtehq/sc/mda-jcnh23b2nbsgtehq.mp4?auth_key=1553434229-0-0-d0e2d4335929110213fc5f86b3416720&bcevod_channel=searchbox_feed&pd=bjh&abtest=all';

    @override
    void initState() {
        super.initState();
        _controller = VideoPlayerController.network(this.url)
        // 播放状态
        ..addListener(() {
            final bool isPlaying = _controller.value.isPlaying;
            if (isPlaying != _isPlaying) {
                setState(() { _isPlaying = isPlaying; });
            }
        })
        // 在初始化完成后必须更新界面
        ..initialize().then((_) {
            setState(() {});
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
                body: new Center(
                child: _controller.value.initialized
                    // 加载成功
                    ? new AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                    ) : new Container(),
                ),
                floatingActionButton: new FloatingActionButton(
                    onPressed: _controller.value.isPlaying
                        ? _controller.pause
                        : _controller.play,
                    child: new Icon(
                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                ),
            );
        
    }
}