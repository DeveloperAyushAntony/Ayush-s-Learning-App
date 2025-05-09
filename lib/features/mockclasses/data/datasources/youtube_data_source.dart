import 'dart:developer';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/features/mockclasses/data/models/video_model.dart';
import 'package:dio/dio.dart';

// Abstract class definition
abstract class YouTubeRemoteDataSource {
  Future<List<VideoModel>> fetchVideos();
}

// Implementation of the abstract class
class YouTubeRemoteDataSourceImpl implements YouTubeRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<List<VideoModel>> fetchVideos() async {
    final url =
        '$baseUrl$channelId&maxResults=500&order=date&type=video&key=$apiKey';

    try {
      final Response response = await Dio(BaseOptions()).get(url);
      // final response = await dio(BaseOptions()).get(url);
      log(response.data.toString()); // Log the full response data

      if (response.statusCode == 200) {
        log("Fetched videos successfully");
        final List<dynamic> items = response.data['items'];
        log(items.toString());
        return items.map((item) => VideoModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load videos');
      }
    } catch (e) {
      log('Error fetching videos: $e');
      throw Exception('Failed to fetch videos: $e');
    }
  }
}
