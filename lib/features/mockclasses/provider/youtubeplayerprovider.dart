import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerProvider with ChangeNotifier {
  late YoutubePlayerController _controller;

  YoutubePlayerController get controller => _controller;

  YouTubePlayerProvider(String videoId) {
    _initialize(videoId);
  }

  void _initialize(String videoId) {
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
