import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPart extends StatefulWidget {
  final String audioUrl;
  final String? thumbnailUrl;
  const AudioPart({
    super.key,
    required this.audioUrl,
    this.thumbnailUrl,
  });

  @override
  State<AudioPart> createState() => _AudioPartState();
}

class _AudioPartState extends State<AudioPart> {
  late AudioPlayer _player;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _togglePlay() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play(UrlSource(widget.audioUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: 40.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Optional: Audio "thumbnail" (or fallback icon)
              SizedBox(
                width: screenWidth*0.8,
                height: screenWidth*0.05,
                child: widget.thumbnailUrl != null
                    ? Image.network(
                  widget.thumbnailUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.music_note)),
                )
                    : Container(
                  color: Colors.grey[200],
                  child: const Center(child: Icon(Icons.music_note, size: 40)),
                ),
              ),
              // Play/pause button overlay, similar to your VideoPart
              Center(
                child: GestureDetector(
                  onTap: _togglePlay,
                  child: Icon(
                    _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                    size: 48,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        // Optionally: Show a label or extra controls here
      ],
    );
  }
}