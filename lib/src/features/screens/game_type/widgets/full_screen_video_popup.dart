import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPopup extends StatefulWidget {
  final String videoUrl;

  const FullScreenVideoPopup({super.key, required this.videoUrl});

  @override
  State<FullScreenVideoPopup> createState() => _FullScreenVideoPopupState();
}

class _FullScreenVideoPopupState extends State<FullScreenVideoPopup> {
  late final VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: [
          Center(
            child: _isInitialized
                ? GestureDetector(
              onTap: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoPlayer(_controller),
                    if (!_controller.value.isPlaying)
                      const Icon(Icons.play_arrow,
                          color: Colors.white, size: 60),
                  ],
                ),
              ),
            )
                : const CircularProgressIndicator(color: Colors.white),
          ),

          // Close button
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                _controller.pause();
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

}
