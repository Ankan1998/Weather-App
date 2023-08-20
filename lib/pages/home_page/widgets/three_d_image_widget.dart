import 'package:flutter/material.dart';

class ThreeDImageWidget extends StatelessWidget {
  final String imgPath;
  const ThreeDImageWidget({
    super.key,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.09,
          bottom: MediaQuery.of(context).size.height * 0.03,
          left: MediaQuery.of(context).size.height * 0.08,
          right: 5,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  color: Colors.black45,
                )
              ],
              borderRadius: BorderRadius.circular(80),
            ),
          ),
        ),
        Image.asset(
          'assets/weather/${imgPath.toLowerCase()}.png',
          height: MediaQuery.of(context).size.height * 0.275,
        ),
      ],
    );
  }
}
