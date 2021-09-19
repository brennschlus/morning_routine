import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morning_routine/screens/home_screen.dart';
import 'package:morning_routine/screens/statistics_screen.dart';

class BottomBar extends StatelessWidget {
  final String activeScreen;
  BottomBar(this.activeScreen);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              Get.to(() => HomeScreen());
            },
            icon: Icon(
              Icons.home_filled,
              color: (activeScreen == 'home') ? Colors.blue : Colors.grey,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => StatisticsScreen());
            },
            icon: Icon(
              Icons.calendar_today,
              color: (activeScreen == 'statistics') ? Colors.blue : Colors.grey,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
