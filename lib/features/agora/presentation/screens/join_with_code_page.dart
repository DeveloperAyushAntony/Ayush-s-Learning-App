import 'package:awoke_learning_app/features/agora/presentation/widgets/streaming_page.dart';
import 'package:flutter/material.dart';

class AgoraVideoScreen extends StatefulWidget {
  const AgoraVideoScreen({super.key});

  @override
  AgoraVideoScreenState createState() => AgoraVideoScreenState();
}

class AgoraVideoScreenState extends State<AgoraVideoScreen> {
  final TextEditingController _channelController = TextEditingController();
  String _selectedRole = "publisher"; // Default role

  /// **Navigate to the Streaming Page**
  void _startStreaming(BuildContext context) {
    final channelName = _channelController.text.trim();
    if (channelName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("❌ Please enter a channel name!")),
      );
      return;
    }

    debugPrint("🎥 Joining Agora Channel: $channelName as $_selectedRole");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StreamingPage(
          channelName: channelName,
          role: _selectedRole,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Join Live Class")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Enter Channel Name:", style: TextStyle(fontSize: 16)),
            TextField(controller: _channelController),
            const SizedBox(height: 16),
            const Text("Select Role:", style: TextStyle(fontSize: 16)),
            DropdownButtonFormField(
              value: _selectedRole,
              onChanged: (String? newValue) {
                if (newValue != null) setState(() => _selectedRole = newValue);
              },
              items: const [
                DropdownMenuItem(value: "publisher", child: Text("📢 Publisher")),
                DropdownMenuItem(value: "subscriber", child: Text("🎥 Subscriber")),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () => _startStreaming(context),
                child: const Text("Start Streaming"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}