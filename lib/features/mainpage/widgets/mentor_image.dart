import 'package:flutter/material.dart';

class MentorImageWidget extends StatelessWidget {
  final String imagePath;
  const MentorImageWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 95,
      height: 95,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(95 / 2),
        child: FadeInImage(
          placeholder: const AssetImage("assets/images/mentorplaceholder.png"),
          fadeInDuration: const Duration(milliseconds: 200),
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
