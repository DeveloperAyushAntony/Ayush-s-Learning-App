import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFadedLine(),
          const Text(
            'OR',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          _buildFadedLine(),
        ],
      ),
    );
  }

  Widget _buildFadedLine() {
    return Container(
      height: 3,
      width: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.black.withValues(alpha: 0.2),// Adjust opacity as needed
            Colors.transparent,
            // ignore: deprecated_member_use
            Colors.black.withValues(alpha: 0.2), // Adjust opacity as needed
          ],
          stops: const [0, 0.5, 1],
        ),
      ),
    );
  }
}
