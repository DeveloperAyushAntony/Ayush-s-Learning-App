import 'package:awoke_learning_app/features/mockclasses/domain/entities/video_entity.dart';

class VideoModel {
  final String videoId;
  final String title;
  final String description;
  final String thumbnailUrl;
  final DateTime publishedAt;
  final String channelTitle;

  VideoModel({
    required this.videoId,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.publishedAt,
    required this.channelTitle,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      videoId: json['id']['videoId'],
      title: json['snippet']['title'],
      description: json['snippet']['description'],
      thumbnailUrl: json['snippet']['thumbnails']['high']['url'],
      publishedAt: DateTime.parse(json['snippet']['publishedAt']),
      channelTitle: json['snippet']['channelTitle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': {'videoId': videoId},
      'snippet': {
        'title': title,
        'description': description,
        'thumbnails': {
          'high': {'url': thumbnailUrl},
        },
        'publishedAt': publishedAt.toIso8601String(),
        'channelTitle': channelTitle,
      },
    };
  }

  // Convert VideoModel to VideoEntity
  VideoEntity toEntity() {
    return VideoEntity(
      id: videoId,
      title: title,
      description: description,
      thumbnailUrl: thumbnailUrl,
      publishedAt: publishedAt,
      duration: "", // Assuming duration can be added if available
    );
  }
}
