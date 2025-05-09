import 'package:awoke_learning_app/core/utils/app_strings.dart';
import 'package:awoke_learning_app/features/courses/widgets/course_widgets.dart';
import 'package:flutter/material.dart';

class InterviewPreparation extends StatelessWidget {
  const InterviewPreparation({super.key});

  @override
  Widget build(BuildContext context) {
    final courseDetailsArguments =
        ModalRoute.of(context)?.settings.arguments as double;
    print(courseDetailsArguments);
    return CourseWidget(
      route: "/coursedetails",
      heading: "Interview Preparation",
      image: "assets/images/interviewpage.svg",
      description: AppStrings.interviewtext,
      courseId: courseDetailsArguments,
    );
  }
}
