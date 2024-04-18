import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
          border: isActive ? null : Border.all(color: Colors.black),
          color: isActive
              ? const Color.fromARGB(255, 2, 48, 128)
              : Colors.blueGrey,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
