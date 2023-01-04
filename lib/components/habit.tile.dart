import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChange;

  const HabitTile(
      {super.key,
      required this.habitName,
      required this.habitCompleted,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.height * 0.03),
      child: Container(
        padding: EdgeInsets.all(size.height * 0.03),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            //chebox
            Checkbox(value: habitCompleted, onChanged: onChange),
            //habit name
            Text(habitName)
          ],
        ),
      ),
    );
  }
}
