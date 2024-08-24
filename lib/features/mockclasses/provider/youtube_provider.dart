
import 'package:flutter/material.dart';
import 'package:awoke_learning_app/features/mockclasses/domain/entities/video_entity.dart';
import 'package:awoke_learning_app/features/mockclasses/domain/usecases/channel_video_usecase.dart';
import 'package:get_it/get_it.dart';

class YouTubeProvider with ChangeNotifier {
  final GetChannelVideos getChannelVideos;
  GetIt getit = GetIt.instance;
  YouTubeProvider({required this.getChannelVideos});

  List<VideoEntity> _videos = [];
  List<VideoEntity> get videos => _videos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchVideos() async {
    _isLoading = true;
    notifyListeners();

    try {
      _videos = await getChannelVideos();
    } catch (e) {
      print('Error fetching videos: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
