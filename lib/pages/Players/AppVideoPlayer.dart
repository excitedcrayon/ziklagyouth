import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';
import 'package:ziklagyouth/config/config.dart';

class AppVideoPlayer extends StatefulWidget {

  final List videoData;
  final int initialIndex;

  const AppVideoPlayer({ required this.videoData, required this.initialIndex, Key? key}) : super(key: key);

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(
      initialPage: widget.initialIndex,
      keepPage: true,
      viewportFraction: 1
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: PageView.builder(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            itemCount: widget.videoData.length,
            itemBuilder: (context, index) {
              return VideoPlayerWidget(videoURL: "${Config.DOMAIN}/${widget.videoData[_currentIndex]["path"]}");
            },
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  
  final String videoURL;
  
  const VideoPlayerWidget({ required this.videoURL, Key? key}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.videoURL);
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoURL))..initialize().then((_) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    _videoPlayerController.setLooping(true);
    //_videoPlayerController.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    return _videoPlayerController.value.isInitialized ? Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(Config.colorBlack),
      ),
      child: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(
            width: _videoPlayerController.value.aspectRatio,
            height: 1,
            child: VideoPlayer(_videoPlayerController),
          ),
        ),
      ),
    ) : const Center ( child: CircularProgressIndicator(),);
  }
}
