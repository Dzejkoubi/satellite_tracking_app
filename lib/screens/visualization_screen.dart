import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class VisualizationScreen extends StatefulWidget {
  const VisualizationScreen({Key? key}) : super(key: key);

  @override
  State<VisualizationScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VisualizationScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the video player
    _controller = VideoPlayerController.asset('assets/videos/sample.mp4')
      ..initialize().then((_) {
        // Once the video is loaded, start playing automatically
        _controller.setLooping(true); // Optional: Loop the video
        _controller.play();
        setState(() {}); // Update the UI to show the video
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Video Example"),
      ),
      child: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CupertinoActivityIndicator(), // Show a loading spinner until the video is ready
      ),
    );
  }
}
