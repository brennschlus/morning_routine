import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:morning_routine/controllers/language_controller.dart';
import 'package:morning_routine/screens/home_screen.dart';
import 'package:get/get.dart';
import 'localisation.dart';

final LanguageController languageController = Get.put(LanguageController());
final myLocal = LanguageController().readSavedLocale();

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: myLocal.isNotEmpty
          ? Locale(myLocal[0], myLocal[1])
          : Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
