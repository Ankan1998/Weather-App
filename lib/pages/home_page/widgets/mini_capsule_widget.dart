import 'package:flutter/material.dart';

class MiniCapsuleWidget extends StatelessWidget {
  final String imgPath;
  final String txt1;
  final String txt2;
  const MiniCapsuleWidget({Key? key, required this.imgPath, required this.txt1, required this.txt2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(
            child: Image.asset(
              imgPath,
              width: MediaQuery.of(context).size.height * 0.05,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            txt1,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            txt2,
            style: TextStyle(fontSize: 14, color: Colors.white54),
          )
        ],
      ),
    );
  }
}
