import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MiniCapsuleBottomWidget extends StatelessWidget {
  final String imgPath;
  final String txt1;
  final String txt2;
  const MiniCapsuleBottomWidget({Key? key, required this.imgPath, required this.txt1, required this.txt2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white38,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                txt1 + " c",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Center(
                child: Image.asset(
                  imgPath,
                  height: 28,
                ),
              ),
              Text(
                txt2,
                style: TextStyle(fontSize: 12, color: Colors.white70),
              )
            ],
          ),
        ),
      ),
    );
  }
}
