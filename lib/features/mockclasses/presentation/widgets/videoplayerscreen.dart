import 'package:awoke_learning_app/features/auth_google/presentation/widgets/back_button.dart';
import 'package:awoke_learning_app/features/mockclasses/provider/youtubeplayerprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String videoId;

  const VideoPlayerScreen({required this.videoId, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => YouTubePlayerProvider(videoId),
      child: Scaffold(
        // Use Stack to overlay the back button on top of the video player
        body: SafeArea(
          child: Stack(
            children: [
              Consumer<YouTubePlayerProvider>(
                builder: (context, playerProvider, child) {
                  return YoutubePlayer(
                    controller: playerProvider.controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    aspectRatio: 18 / 11,
                  );
                },
              ),
              if (MediaQuery.of(context).orientation == Orientation.portrait)
                const Positioned(
                  top: 8.0,
                  left: 8.0,
                  child: CustomBackButton(), // Display the custom back button
                ),
            ],
          ),
        ),
      ),
    );
  }
}
