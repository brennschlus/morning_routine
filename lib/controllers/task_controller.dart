import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:morning_routine/widgets/task.dart';

class TaskController extends GetxController {
  var tasks = [].obs;

  @override
  void onInit() {
    List<dynamic>? storedTasks = GetStorage().read<List>('tasks');

    if (storedTasks != null) {
      tasks = storedTasks.map((e) => Task.fromJson(e)).toList().obs;
    }

    ever(
      tasks,
      (callback) => GetStorage().write(
        'tasks',
        tasks.toList(),
      ),
    );
    super.onInit();
  }
}
