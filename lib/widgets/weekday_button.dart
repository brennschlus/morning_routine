import 'package:flutter/material.dart';

class WeekdayButton extends StatefulWidget {
  final String weekday;
  WeekdayButton(this.weekday);

  @override
  State<WeekdayButton> createState() => _WeekdayButtonState();
}

class _WeekdayButtonState extends State<WeekdayButton> {
  bool isChecked = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          primary: isChecked ? Colors.blueGrey : Colors.blue),
      child: Text(widget.weekday),
      onPressed: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
    );
  }
}

List<String> weekDays = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

List<Widget> weekDaysButtons =
    List.generate(7, (index) => WeekdayButton(weekDays[index]));
