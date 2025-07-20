import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

final videoPlayerControllerProvider = AsyncNotifierProvider.autoDispose
    .family<VideoPlayerControllerNotifier, VideoPlayerController, String>(
  VideoPlayerControllerNotifier.new,
);

class VideoPlayerControllerNotifier
    extends AutoDisposeFamilyAsyncNotifier<VideoPlayerController, String> {
  @override
  Future<VideoPlayerController> build(String videoUrl) async {
    final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    await controller.initialize();
    ref.onDispose(() {
      controller.dispose();
    });
    return controller;
  }
}
