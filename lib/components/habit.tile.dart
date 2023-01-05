import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChange;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTile(
      {super.key,
      required this.habitName,
      required this.habitCompleted,
      required this.onChange,
      required this.settingsTapped,
      required this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.height * 0.015),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            // settings optin
            SlidableAction(
              onPressed: settingsTapped,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.mode_edit_outlined,
              borderRadius: BorderRadius.circular(12),
            ),

            // delete option
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Colors.red.shade400,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(size.height * 0.015),
          decoration: BoxDecoration(
            color: habitCompleted
                ? Color.fromARGB(150, 2, 179, 8)
                : Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //chebox
                  Checkbox(value: habitCompleted, onChanged: onChange),
                  //habit name
                  Text(
                    habitName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: habitCompleted ? Colors.white : Colors.black54,
                        fontSize: 17),
                  )
                ],
              ),
              Icon(Icons.arrow_back,
                  size: 25,
                  color: habitCompleted ? Colors.white70 : Colors.grey[500])
            ],
          ),
        ),
      ),
    );
  }
}
