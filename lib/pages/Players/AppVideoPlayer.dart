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
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(Config.colorBlack),
            ),
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: widget.videoData.length,
              itemBuilder: (context, index) {
                return VideoPlayerWidget(videoData: widget.videoData, videoIndex: _currentIndex,);
              },
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  
  final List videoData;
  final int videoIndex;
  
  const VideoPlayerWidget({ required this.videoData, required this.videoIndex, Key? key}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String videoURL = "${Config.DOMAIN}/${widget.videoData[widget.videoIndex]["path"]}";
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoURL))..initialize().then((_) {
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
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          // back icon to close video player
          Container(
            width: double.infinity,
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    color: Color(Config.colorDarkGrey),
                    size: Config.iconMediumSize,
                  ),
                ),
                Text(
                  widget.videoData[widget.videoIndex]["title"],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(Config.colorDarkGrey),
                  ),
                ),
              ],
            ),
          ),
          // video player
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                width: _videoPlayerController.value.aspectRatio,
                height: 1,
                child: VideoPlayer(_videoPlayerController),
              ),
            ),
          ),
          // Video progression bar
          Container(
            width: double.infinity,
            alignment: AlignmentDirectional.bottomStart,
            child: VideoProgressIndicator(
              _videoPlayerController,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                backgroundColor: Color(Config.colorLightGrey),
                bufferedColor: Color(Config.colorDarkGrey)
              ),
            ),
          ),
          // video controls

        ]
      ),
    ) : const Center ( child: CircularProgressIndicator(),);
  }
}
