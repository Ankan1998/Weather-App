import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationWithTitleWidget extends StatelessWidget {
  final String assetPath;
  final String bottomText;
  const AnimationWithTitleWidget({
    super.key,
    required this.assetPath,
    required this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            assetPath,
            height: MediaQuery.of(context).size.height * 0.6,
            repeat: true,
          ),
          Text(
            bottomText,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(color: Colors.white38, blurRadius: 3),
                Shadow(color: Colors.white, blurRadius: 6),
              ],
            ),
          )
        ],
      ),
    );
  }
}
