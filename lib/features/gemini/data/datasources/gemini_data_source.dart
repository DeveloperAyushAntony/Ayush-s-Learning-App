
import 'package:awoke_learning_app/features/gemini/data/models/gemini_model.dart';
import 'package:dio/dio.dart';
import 'package:google_generative_ai/google_generative_ai.dart';


class GeminiRemoteDataSource {
  final Dio dio;
  final GenerativeModel generativeModel;

  GeminiRemoteDataSource({required this.dio, required String apiKey})
      : generativeModel = GenerativeModel(
          model: 'gemini-1.5-flash',
          apiKey: apiKey,
          generationConfig: GenerationConfig(
            temperature: 0.4,
            topK: 32,
            topP: 1,
            maxOutputTokens: 4096,
          ),
          safetySettings: [
            SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
            SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
          ],
        );

  Future<ChatMessageModel> sendMessage(String message) async {
    try {
      final response = await generativeModel.generateContent([Content.text(message)]);
      
      if (response.text == null) {
        throw Exception('No response from API');
      }

      return ChatMessageModel(isUser: false, message: response.text!);
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }
}
