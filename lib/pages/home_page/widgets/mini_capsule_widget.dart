import 'package:flutter/material.dart';

class MiniCapsuleWidget extends StatelessWidget {
  final String imgPath;
  final String txt1;
  final String txt2;
  const MiniCapsuleWidget(
      {Key? key, required this.imgPath, required this.txt1, required this.txt2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(
            child: Image.asset(
              imgPath,
              width: 24,
            ),
          ),
          Text(
            txt1,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          Text(
            txt2,
            style: TextStyle(fontSize: 12, color: Colors.white54),
          )
        ],
      ),
    );
  }
}
