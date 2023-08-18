import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:weather_app/pages/home_page/home_page.dart';
import 'package:weather_app/pages/lock_page/providers/lock_page_provider.dart';
import 'package:weather_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class LockPage extends StatefulWidget {
  const LockPage({Key? key}) : super(key: key);

  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
  @override
  void initState() {
    Provider.of<LockPageProvider>(context, listen: false).getPermission();
    // Advantage of Singleton Pattern
    // LockPageProvider lockPageProvider = LockPageProvider();
    // lockPageProvider.getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/misc/thundering.png'), fit: BoxFit.cover),
              ),
            ),
            Container(
              color: Color.fromRGBO(0, 0, 0, 0.6),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.2, // Adjust the position as needed
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome To",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 6,
                          fontFamily: 'TiltPrism',
                          shadows: [
                            Shadow(color: Colors.white, blurRadius: 3),
                            Shadow(color: Colors.white, blurRadius: 9),
                          ],
                        ),
                      ),
                      Text(
                        "WeatherX",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 6,
                          fontFamily: 'TiltPrism',
                          shadows: [
                            Shadow(color: Colors.white, blurRadius: 3),
                            Shadow(color: Colors.white, blurRadius: 9),
                            Shadow(color: Colors.white54, blurRadius: 15),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Center(
                  child: Consumer<LockPageProvider>(builder: (context, provider, child) {
                    return AbsorbPointer(
                      absorbing: !provider.isLocationPermissionGiven,
                      child: SlideAction(
                        text: "Slide to Open",
                        outerColor: Colors.white70,
                        innerColor: AppColors.xBackgroundColor,
                        submittedIcon: Icon(
                          Icons.lock_open_outlined,
                          color: Colors.black,
                        ),
                        sliderButtonIcon: Icon(
                          Icons.lock_outline,
                          color: provider.isLocationPermissionGiven ? Colors.lightGreenAccent : Colors.redAccent,
                        ),
                        onSubmit: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
