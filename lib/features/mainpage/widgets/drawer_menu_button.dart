import 'package:flutter/material.dart';

class DrawerMenuButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerMenuButton({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        scaffoldKey.currentState?.openDrawer();
      },
      child: SizedBox(
        height: 50,
        width: 40,
        child: Image.asset(
          "assets/images/menu.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
