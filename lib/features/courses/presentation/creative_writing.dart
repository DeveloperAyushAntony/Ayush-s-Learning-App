import 'package:awoke_learning_app/core/utils/app_strings.dart';
import 'package:awoke_learning_app/features/courses/widgets/course_widgets.dart';
import 'package:flutter/material.dart';

class Creativewriting extends StatelessWidget {
  const Creativewriting({super.key});

  @override
  Widget build(BuildContext context) {
    final courseDetailsArguments =
        ModalRoute.of(context)?.settings.arguments as double;
    print(courseDetailsArguments);
    return const CourseWidget(
      route: "/coursedetails",
      heading: "Creative Writing",
      image: "assets/images/creativepage.svg",
      description: AppStrings.creativewritingtext,
    );
  }
}
