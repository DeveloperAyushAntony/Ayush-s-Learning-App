import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MentorImageWidget extends StatelessWidget {
  final String imagePath;
  const MentorImageWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      child: SizedBox(
          width: 95,
          height: 95,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(95 / 2),
              child: SvgPicture.asset(imagePath))),
    );
  }
}
