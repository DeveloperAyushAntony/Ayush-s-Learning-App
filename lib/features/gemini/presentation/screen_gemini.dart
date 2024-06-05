import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/core/widgets/top_gradientcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenGemini extends StatelessWidget {
  ScreenGemini({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                const GradientCard(
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
            const SizedBox(height: 20), // Add spacing after the header
            Row(
              children: [
                TextFormField(
                  controller: _textEditingController, // Assign the controller
                  decoration: InputDecoration(
                    hintText: "Type your question here...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                IconButton(
                  // Use IconButton instead of Icon
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Handle send button press (e.g., submit question)
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
