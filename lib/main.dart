import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:morning_routine/controllers/language_controller.dart';
import 'package:morning_routine/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:morning_routine/screens/new_routine.dart';
import 'localisation.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final myLocal = LanguageController().readSavedLocale();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: Locale(myLocal[0], myLocal[1]),
      debugShowCheckedModeBanner: false,
      home: NewRoutine(),
    );
  }
}
