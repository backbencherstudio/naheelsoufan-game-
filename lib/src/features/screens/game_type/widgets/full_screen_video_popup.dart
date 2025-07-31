import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../riverpod/video_player_controller_notifier.dart';

class FullScreenVideoPopup extends ConsumerWidget {
  final String videoUrl;

  const FullScreenVideoPopup({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerAsync = ref.watch(videoPlayerControllerProvider(videoUrl));

    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: [
          Center(
            child: controllerAsync.when(
              loading: () =>
              const CircularProgressIndicator(color: Colors.white),
              error: (e, _) => Text('Error: $e', style: const TextStyle(color: Colors.white)),
              data: (controller) {
                return GestureDetector(
                  onTap: () {
                    if (controller.value.isPlaying) {
                      controller.pause();
                    } else {
                      controller.play();
                    }
                  },
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        VideoPlayer(controller),
                        if (!controller.value.isPlaying)
                          const Icon(Icons.play_arrow,
                              color: Colors.white, size: 60),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Close button
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
