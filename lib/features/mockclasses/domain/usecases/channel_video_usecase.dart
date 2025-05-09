import 'package:awoke_learning_app/features/mockclasses/domain/entities/video_entity.dart';
import 'package:awoke_learning_app/features/mockclasses/domain/repository/youtube_repository.dart';

class GetChannelVideos {
  final YoutubeRepository repository;

  GetChannelVideos(this.repository);

  Future<List<VideoEntity>> call() {
    print(repository.toString());
    return repository.fetchVideo();
  }
}
