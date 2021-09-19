import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morning_routine/controllers/task_controller.dart';
import 'package:morning_routine/widgets/task.dart';
import 'package:morning_routine/constants.dart';

Future<dynamic> modalBottomSheet(BuildContext context) {
  // since TaskController already initalise in home_screen.dart
  // there are no need to initialise it second time
  final TaskController _controller = Get.find();

  TextEditingController textEditingController = TextEditingController();
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text(
                kNewTaskTitle.tr,
                style: TextStyle(fontSize: 36),
              ),
              TextFormField(
                controller: textEditingController,
                autofocus: true,
                style: TextStyle(fontSize: 25),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.tasks.add(
                    Task(
                      text: textEditingController.text,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Container(
                  child: Text(kNewTaskButton.tr),
                ),
              )
            ],
          ),
        );
      });
}
