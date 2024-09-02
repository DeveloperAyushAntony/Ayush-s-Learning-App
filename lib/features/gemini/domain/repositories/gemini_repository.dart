
import 'package:awoke_learning_app/features/gemini/domain/entities/chat_message.dart';
abstract class GeminiRepository {
  Future<ChatMessage> sendMessage(String message);
}