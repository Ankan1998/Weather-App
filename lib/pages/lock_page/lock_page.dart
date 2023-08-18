import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:weather_app/utils/app_colors.dart';

class LockPage extends StatefulWidget {
  const LockPage({Key? key}) : super(key: key);

  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/misc/thundering.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
            Positioned(
              bottom: 20, // Adjust the position as needed
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                child: Center(
                  child: SlideAction(
                    outerColor: Colors.white54,
                    innerColor: AppColors.xBackgroundColor,
                    submittedIcon: Icon(
                      Icons.lock_open_outlined,
                      color: Colors.black,
                    ),
                    sliderButtonIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.redAccent,
                    ),
                    onSubmit: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
