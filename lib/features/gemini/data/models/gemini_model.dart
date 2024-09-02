import 'package:awoke_learning_app/features/gemini/domain/entities/chat_message.dart';

class ChatMessageModel extends ChatMessage {
  ChatMessageModel({required super.isUser, required super.message});

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      isUser: json['is_user'] as bool,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_user': isUser,
      'message': message,
    };
  }
}