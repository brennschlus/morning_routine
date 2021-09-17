import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:morning_routine/screens/home_screen.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
