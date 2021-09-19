import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> myMaterialDialog(BuildContext context) {
  // final List locale = [
  //   {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
  //   {'name': 'RUSSIAN', 'locale': Locale('ru', 'RU')},
  // ];
  // updateLanguage(Locale locale) {
  //   Get.back();
  //   Get.updateLocale(locale);
  // }

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.updateLocale(Locale('en', 'US'));
                  print(Get.locale);
                },
                child: Text('English'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.updateLocale(Locale('ru', 'RU'));
                  print(Get.locale);
                },
                child: Text('Russian'),
              ),
            ],
          ),
        );
      });
}
