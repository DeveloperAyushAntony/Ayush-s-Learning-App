import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Awokelogo extends StatelessWidget {
  final double logowidth;

  final double logoheight;

  const Awokelogo({
    super.key,
    required this.logowidth,
    required this.logoheight,
  });

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await precacheImage(
    //       const AssetImage("assets/images/awoke hd.svg"), context);
    // });

    return Column(
      children: [
        SizedBox(
          // height: 73,
          // width: 59,
          height: logoheight,
          width: logowidth,
          // child: Image.asset(
          //   "assets/images/awoke hd.png",
          //   fit: BoxFit.cover,
          // ),
          child: SvgPicture.asset("assets/images/awoke hd.svg"),
        ),
      ],
    );
  }
}
