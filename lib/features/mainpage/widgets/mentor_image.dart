import 'package:flutter/material.dart';

class MentorImageWidget extends StatelessWidget {
  final String imagePath;
  const MentorImageWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 95,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(imagePath), fit: BoxFit.contain)),
    );
  }
  
}
