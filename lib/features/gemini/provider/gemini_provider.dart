import 'package:flutter/material.dart';
import 'package:awoke_learning_app/features/gemini/domain/entities/chat_message.dart';
import 'package:awoke_learning_app/features/gemini/domain/usecases/send_message_usecase.dart';

class GeminiProvider with ChangeNotifier {
  final SendMessageUseCase sendMessageUseCase;
  final List<ChatMessage> _messages = [];
  
  List<ChatMessage> get messages => _messages;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  GeminiProvider(this.sendMessageUseCase);

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    // Add user's message to the chat
    _messages.add(ChatMessage(isUser: true, message: message));
    notifyListeners();

    _isLoading = true;
    notifyListeners();

    try {
      final response = await sendMessageUseCase(message);
      _messages.add(response);
    } catch (e) {
      _messages.add(ChatMessage(isUser: false, message: 'Error: $e'));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
