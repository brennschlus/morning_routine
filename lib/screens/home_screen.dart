import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morning_routine/controllers/language_controller.dart';
import 'package:morning_routine/controllers/task_controller.dart';
import 'package:morning_routine/widgets/language_choose_dialoge.dart';
import 'package:morning_routine/widgets/modal_bottomsheet.dart';
import 'package:morning_routine/widgets/bottom_bar.dart';
import 'package:morning_routine/constants.dart';

final weekDay = DateTime.now().weekday;
final hour = DateTime.now().hour;

// TODO move this function away

String dayTime() {
  if (hour >= 0 && hour < 6) {
    return perioOfDay[0];
  } else if (hour >= 6 && hour < 12) {
    return perioOfDay[1];
  } else if (hour >= 12 && hour < 18) {
    return perioOfDay[2];
  } else {
    return perioOfDay[3];
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController taskController = Get.put(TaskController());
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar('home'),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            myMaterialDialog(context);
          },
          icon: Icon(Icons.language),
        ),
        title: Text('${dayTime()} ${kWeekDays[weekDay]}'),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.help_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.green,
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Obx(
                () => ListView.separated(
                    itemBuilder: (context, index) => Dismissible(
                          key: UniqueKey(),
                          onDismissed: (_) {
                            var removed = taskController.tasks[index];
                            taskController.tasks.removeAt(index);
                            Get.snackbar('Task removed',
                                'The task ${removed.text} was removed');
                          },
                          child: ListTile(
                            title: Text(
                              taskController.tasks[index].text,
                              style: (taskController.tasks[index].done)
                                  ? TextStyle(
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough)
                                  : TextStyle(color: Colors.black),
                            ),
                            onTap: () {},
                            trailing: Checkbox(
                              value: taskController.tasks[index].done,
                              onChanged: (value) {
                                var changed = taskController.tasks[index];
                                changed.done = value as bool;
                                taskController.tasks[index] = changed;
                              },
                            ),
                          ),
                        ),
                    separatorBuilder: (_, __) => Divider(),
                    itemCount: taskController.tasks.length),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modalBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
