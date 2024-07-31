import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWelcomeText extends StatelessWidget {
  const HomeWelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final firstName = authProvider.userFirstName;
    return Column(
      children: [
        kHeight30,
        Text(
          "Hello",
          style: mainpageheadtext,
        ),
        Text(
          firstName ?? "User",
          style: mainpagepersontext,
        )
      ],
    );
  }
}
