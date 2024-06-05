import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerItem extends StatelessWidget {
  final VoidCallback click;
  final String svgpath;
  final String itemname;
  const DrawerItem(
      {super.key,
      required this.click,
      required this.svgpath,
      required this.itemname});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Card(
        elevation: 6,
        color: klightbluegrey,
        child: ListTile(
          onTap: click,
          leading: SizedBox(
            height: 45,
            width: 45,
            child: SvgPicture.asset(svgpath),
          ),
          title: Text(itemname, style: drawerText),
        ),
      ),
    );
  }
}
