import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morning_routine/constants.dart';
import 'package:morning_routine/controllers/language_controller.dart';

Future<dynamic> myMaterialDialog(BuildContext context) {
  final LanguageController languageController = Get.find();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(chooseLanguage.tr),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.updateLocale(Locale('en', 'US'));
                  languageController.saveLocale(['en', 'US']);
                },
                child: Text(englishLanguage.tr),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.updateLocale(Locale('ru', 'RU'));
                  languageController.saveLocale(['ru', 'RU']);
                },
                child: Text(russianLanguage.tr),
              ),
            ],
          ),
        );
      });
}
