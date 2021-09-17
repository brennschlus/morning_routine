import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morning_routine/controllers/task_controller.dart';
import 'package:morning_routine/widgets/modal_bottomsheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController _controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: null,
          icon: Icon(Icons.menu),
        ),
        title: Text('Monday Morning'),
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
                            var removed = _controller.tasks[index];
                            _controller.tasks.removeAt(index);
                            Get.snackbar('Task removed',
                                'The task ${removed.text} was removed');
                          },
                          child: ListTile(
                            title: Text(
                              _controller.tasks[index].text,
                              style: (_controller.tasks[index].done)
                                  ? TextStyle(
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough)
                                  : TextStyle(color: Colors.black),
                            ),
                            onTap: () {},
                            trailing: Checkbox(
                              value: _controller.tasks[index].done,
                              onChanged: (value) {
                                var changed = _controller.tasks[index];
                                changed.done = value as bool;
                                _controller.tasks[index] = changed;
                              },
                            ),
                          ),
                        ),
                    separatorBuilder: (_, __) => Divider(),
                    itemCount: _controller.tasks.length),
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
