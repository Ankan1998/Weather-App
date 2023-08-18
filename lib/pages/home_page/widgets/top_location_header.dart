import 'package:flutter/material.dart';

class TopLocationHeader extends StatelessWidget {
  final String cityName;
  final VoidCallback onPressed;
  const TopLocationHeader({
    super.key,
    required this.cityName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.refresh,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              onPressed();
            },
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  cityName,
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 34,
          )
        ],
      ),
    );
  }
}
