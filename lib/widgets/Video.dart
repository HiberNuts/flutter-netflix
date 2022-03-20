import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:netflix/screens/Detail.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  VideoPlayerController videoPlayerController;

  final bool loop;
  Video({Key? key, required this.videoPlayerController, required this.loop})
      : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  ChewieController _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(''));

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      looping: widget.loop,
      aspectRatio: 3 / 2,
      fullScreenByDefault: true,
      allowFullScreen: true,
      autoPlay: true,
      materialProgressColors: ChewieProgressColors(
          backgroundColor: Colors.red,
          playedColor: Colors.red,
          bufferedColor: Colors.red,
          handleColor: Colors.red),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   print(widget.videoPlayerController);
  //   return widget.videoPlayerController != null
  //       ? Container(
  //           alignment: Alignment.center,
  //           child: buildVideo(),
  //         )
  //       : Container(
  //           height: 200,
  //           child: const Center(
  //             child: CircularProgressIndicator(),
  //           ),
  //         );
  // }

  // Widget buildVideo() => buildVideoPlayer();

  // Widget buildVideoPlayer() => VideoPlayer(widget.videoPlayerController);
}

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key, required this.videoData}) : super(key: key);
  final videoData;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Video(
            loop: true,
            videoPlayerController:
                VideoPlayerController.network(widget.videoData),
          ),
        ),
      ),
    );
  }
}

// class TrialVIdeoPlayer extends StatefulWidget {
//   const TrialVIdeoPlayer({Key? key}) : super(key: key);

//   @override
//   State<TrialVIdeoPlayer> createState() => _TrialVIdeoPlayerState();
// }

// class _TrialVIdeoPlayerState extends State<TrialVIdeoPlayer> {
//   VideoPlayerController controller =
//       VideoPlayerController.network("https://youtu.be/ndl1W4ltcmg");

//   @override
//   void initState() {
//     super.initState();
//     controller = VideoPlayerController.network("https://youtu.be/ndl1W4ltcmg")
//       ..addListener(() => setState(() {}))
//       ..setLooping(true)
//       ..initialize().then((_) => controller.play());
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Video(
//       videoPlayerController: controller,
//       loop: true,
//     );
//   }
// }
