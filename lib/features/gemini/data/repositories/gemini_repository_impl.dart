

import 'package:awoke_learning_app/features/gemini/data/datasources/gemini_data_source.dart';
import 'package:awoke_learning_app/features/gemini/domain/entities/chat_message.dart';
import 'package:awoke_learning_app/features/gemini/domain/repositories/gemini_repository.dart';

class GeminiRepositoryImpl implements GeminiRepository {
  final GeminiRemoteDataSource remoteDataSource;

  GeminiRepositoryImpl(this.remoteDataSource);

  @override
  Future<ChatMessage> sendMessage(String message) async {

    return remoteDataSource.sendMessage(message);
  }
}
