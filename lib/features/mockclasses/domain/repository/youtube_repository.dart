import 'package:awoke_learning_app/features/mockclasses/domain/entities/video_entity.dart';

abstract class YoutubeRepository {
  Future<List<VideoEntity>> fetchVideo();
}
