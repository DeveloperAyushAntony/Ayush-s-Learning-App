import 'package:awoke_learning_app/features/gemini/domain/entities/chat_message.dart';
import 'package:awoke_learning_app/features/gemini/domain/repositories/gemini_repository.dart';

class SendMessageUseCase {
  final GeminiRepository repository;

  SendMessageUseCase(this.repository);

  Future<ChatMessage> call(String message) {
    return repository.sendMessage(message);
  }
}