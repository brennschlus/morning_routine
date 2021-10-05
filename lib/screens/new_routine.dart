import 'package:flutter/material.dart';
import 'package:morning_routine/widgets/weekday_button.dart';

class NewRoutine extends StatefulWidget {
  const NewRoutine({Key? key}) : super(key: key);

  @override
  State<NewRoutine> createState() => _NewRoutineState();
}

class _NewRoutineState extends State<NewRoutine> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  void _selectedTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('new routine'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'name',
                  style: TextStyle(fontSize: 24),
                ),
                Expanded(child: TextFormField())
              ],
            ),
            Row(
              children: [Text('tag', style: TextStyle(fontSize: 24))],
            ),
            Row(
              children: [
                Text('time', style: TextStyle(fontSize: 24)),
                TextButton(
                  onPressed: _selectedTime,
                  child: Text('${_time.format(context)}'),
                )
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: weekDaysButtons),
          ],
        ),
      ),
    );
  }
}
