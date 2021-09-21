import 'package:get/get.dart';
import 'constants.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          newTaskTitle: 'What you gonna do?',
          newTaskButton: 'Done',
          chooseLanguage: 'Choose language',
          englishLanguage: 'English',
          russianLanguage: 'Russian',
          monday: 'monday',
          tuesday: 'tuesday',
          wednesday: 'wednesday',
          thursday: 'thursday',
          friday: 'friday',
          saturday: 'saturday',
          sunday: 'sunday',
          night: 'night',
          morning: 'morning',
          noon: 'noon',
          evening: 'evening',
        },
        'ru_RU': {
          newTaskTitle: 'Что ты будешь делать?',
          newTaskButton: 'Готово',
          chooseLanguage: 'Выберите язык',
          englishLanguage: 'Английский',
          russianLanguage: 'Русский',
          monday: 'понедельника',
          tuesday: 'вторника',
          wednesday: 'среды',
          thursday: 'четверга',
          friday: 'пятницы',
          saturday: 'субботы',
          sunday: 'воскресенья',
          night: 'ночь',
          morning: 'утро',
          noon: 'полдень',
          evening: 'вечер',
        }
      };
}
