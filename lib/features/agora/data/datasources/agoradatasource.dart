import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/agora_model.dart';

class AgoraRemoteDataSource {
  final Dio _dio = Dio();
  final String? supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

  Future<AgoraModel> fetchAgoraToken(String channelName, int uid, String role) async {
    if (supabaseAnonKey == null || supabaseAnonKey!.isEmpty) {
      throw Exception("❌ Supabase Anon Key is missing.");
    }
    if (channelName.trim().isEmpty) {
      throw Exception("❌ Channel name cannot be empty.");
    }

    try {
      final requestData = {
        "channelName": channelName.trim(),
        "uid": uid.toString(),
        "role": role.toLowerCase(),
      };

      print("📤 Sending request to Supabase: ${jsonEncode(requestData)}");

      final response = await _dio.post(
        "https://payatoupsligfnspqqxv.supabase.co/functions/v1/agora_token_server",
        options: Options(headers: {
          "Authorization": "Bearer $supabaseAnonKey",
          "Content-Type": "application/json",
        }),
        data: jsonEncode(requestData),
      );

      print("✅ Supabase Response: ${response.data}");

      if (response.statusCode == 200 && response.data["token"] != null) {
        return AgoraModel.fromJson(response.data);
      } else {
        throw Exception("❌ Invalid response from Supabase: ${response.data}");
      }
    } catch (e) {
      print("❌ Error fetching Agora token: $e");
      throw Exception("Error fetching Agora token: $e");
    }
  }
}
