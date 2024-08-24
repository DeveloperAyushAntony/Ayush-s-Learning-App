import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final DateTime publishedAt;
  final String duration;

  const VideoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.publishedAt,
    required this.duration,
  });

  @override
  
  List<Object?> get props => [
        id,
        title,
        description,
        thumbnailUrl,
        publishedAt,
        duration
      ];
}
