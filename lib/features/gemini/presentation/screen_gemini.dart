import 'package:awoke_learning_app/features/gemini/provider/gemini_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/core/widgets/top_gradientcard.dart';

class ScreenGemini extends StatelessWidget {
  ScreenGemini({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final geminiProvider = Provider.of<GeminiProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header section
            Stack(
              children: [
                const GradientCard(
                  bottomleftval: Radius.circular(40),
                  bottomrightval: Radius.circular(40),
                  gradientcolors: [
                    Color(0xff30448C),
                    Color(0xff0D1326),
                  ],
                  customheight: 80,
                  customwidth: 800,
                  customalighnmentbegin: Alignment.bottomCenter,
                  customalighnmentend: Alignment.topCenter,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 2,
                  child: Text(
                    "Ask Gemini",
                    style: appTexttitle,
                  ),
                ),
              ],
            ),

            // Spacer to add some space between the header and the chat area
            const SizedBox(height: 10),

            // Chat messages area
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.grey[200], // Background color for chat area
                child: ListView.builder(
                  itemCount: geminiProvider.messages.length,
                  itemBuilder: (context, index) {
                    final chatMessage = geminiProvider.messages[index];
                    return ChatMessage(
                      isUser: chatMessage.isUser,
                      message: chatMessage.message,
                    );
                  },
                ),
              ),
            ),

            // Input area
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: "Type your question here...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.send_rounded,
                      size: 35,
                    ),
                    onPressed: () {
                      final message = _textEditingController.text.trim();
                      if (message.isNotEmpty) {
                        geminiProvider.sendMessage(message);
                        _textEditingController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),

            // Loading indicator
            if (geminiProvider.isLoading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isUser;
  final String message;

  const ChatMessage({super.key, required this.isUser, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isUser
              ? const Color.fromARGB(255, 21, 24, 212)
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
