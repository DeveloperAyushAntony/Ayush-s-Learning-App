import 'package:awoke_learning_app/features/mockclasses/data/datasources/youtube_data_source.dart';
import 'package:awoke_learning_app/features/mockclasses/domain/entities/video_entity.dart';
import 'package:awoke_learning_app/features/mockclasses/domain/repository/youtube_repository.dart';

class YoutubeRepositoryImpl implements YoutubeRepository {
  final YouTubeRemoteDataSource remoteDataSource;

  YoutubeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<VideoEntity>> fetchVideo() async {
    final videoModels = await remoteDataSource.fetchVideos();
    // Convert VideoModel to VideoEntity if necessary
    return videoModels.map((videoModel) => videoModel.toEntity()).toList();
  }
}
