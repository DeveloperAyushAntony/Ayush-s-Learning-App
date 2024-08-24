import 'package:awoke_learning_app/features/mockclasses/presentation/widgets/videoplayerscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/core/widgets/top_gradientcard.dart';
import 'package:awoke_learning_app/features/mockclasses/provider/youtube_provider.dart';

class ScreenMockClass extends StatelessWidget {
  const ScreenMockClass({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                const GradientCard(
                  bottomleftval: Radius.circular(40),
                  bottomrightval: Radius.circular(40),
                  customalighnmentbegin: Alignment.bottomCenter,
                  customalighnmentend: Alignment.topCenter,
                  customheight: 80,
                  customwidth: 800,
                  gradientcolors: [
                    Color(0xff30448C),
                    Color(0xff0D1326),
                  ],
                ),
                Align(
                  heightFactor: 2,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Sample Classes",
                    style: appTexttitle,
                  ),
                )
              ],
            ),
            kHeight10,
            Expanded(
              child: Consumer<YouTubeProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    ));
                  }
                  if (provider.videos.isEmpty) {
                    return const Center(child: Text('No videos available'));
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: provider.videos.length,
                    itemBuilder: (BuildContext context, int index) {
                      final video = provider.videos[index];

                      return ListTile(
                        title: Text(video.title, style: bodyText),
                        // subtitle: Text(video.description, style: bodyText),
                        leading: Image.network(video.thumbnailUrl),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  VideoPlayerScreen(videoId: video.id),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
