import 'package:awoke_learning_app/core/utils/app_strings.dart';
import 'package:awoke_learning_app/features/courses/widgets/course_widgets.dart';
import 'package:flutter/material.dart';

class PublicSpeaking extends StatelessWidget {
  const PublicSpeaking({super.key});

  @override
  Widget build(BuildContext context) {
    return const CourseWidget(
      route: "/coursedetails",
      heading: "Public Speaking",
      image: "assets/images/publicspeakpage.svg",
      description: AppStrings.publicspeaktext,
    );
  }
}
