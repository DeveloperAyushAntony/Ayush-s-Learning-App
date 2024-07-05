import 'package:awoke_learning_app/core/utils/app_strings.dart';
import 'package:awoke_learning_app/features/courses/widgets/course_widgets.dart';
import 'package:flutter/material.dart';

class PersonalityDevelopment extends StatelessWidget {
  const PersonalityDevelopment({super.key});

  @override
  Widget build(BuildContext context) {
    return const CourseWidget(
      route: "/coursedetails",
      heading: "Personality Development",
      image: "assets/images/personalitypage.svg",
      description: AppStrings.personalitytext,
    );
  }
}
