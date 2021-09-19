import 'package:get/get.dart';
import 'constants.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          kNewTaskTitle: 'What you gonna do?',
          kNewTaskButton: 'Done',
        },
        'ru_RU': {
          kNewTaskTitle: 'Что ты будешь делать?',
          kNewTaskButton: 'Готово'
        }
      };
}
