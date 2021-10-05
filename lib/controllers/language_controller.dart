import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final languageController = GetStorage();

  var myLocal = [];

  void saveLocale(List list) {
    languageController.write('savedLocale', list);
  }

  List readSavedLocale() {
    var savedLocale = languageController.read('savedLocale');
    if (savedLocale != null) {
      return savedLocale;
    } else
      return savedLocale = ['en', 'US'];
  }

  @override
  void onInit() {
    List<dynamic>? savedLocale = languageController.read('savedLocale');
    if (savedLocale != null) {
      myLocal = savedLocale;
    }
    super.onInit();
  }
}
