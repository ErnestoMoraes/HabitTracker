import 'package:flutter/material.dart';
import 'package:habittacker/components/habit.tile.dart';
import 'package:habittacker/components/my.alert.box.dart';
import 'package:habittacker/components/my.fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // data stracture for todays list
  List todayHabitList = [];

  // checkboc was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      todayHabitList[index][1] = value;
    });
  }

  // create a new habit
  final _newHabitNameController = TextEditingController();

  //create new habit
  void createNewHabit() {
    //show alert dialog for user to enter the new habit details
    showDialog(
      context: context,
      builder: ((context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: 'Entre Habit Name..',
          onSave: saveNewHabit,
          onCancel: cancelDialogBox,
        );
      }),
    );
  }

  // save new habit
  void saveNewHabit() {
    setState(() {
      todayHabitList.add([_newHabitNameController.text, false]);
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  // cancel new habit
  void cancelDialogBox() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  // open habit setting to edit
  void openHabitSetting(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
            controller: _newHabitNameController,
            hintText: todayHabitList[index][0],
            onSave: () => saveExistingHabit(index),
            onCancel: cancelDialogBox);
      },
    );
  }

  // save existing habit with a new name
  void saveExistingHabit(int index) {
    setState(() {
      todayHabitList[index][0] = _newHabitNameController.text;
    });
    cancelDialogBox();
  }

  // delete habit
  void deleteHabit(int index) {
    setState(() {
      todayHabitList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit),
      body: ListView.builder(
        itemCount: todayHabitList.length,
        itemBuilder: (context, index) {
          return HabitTile(
            habitName: todayHabitList[index][0],
            habitCompleted: todayHabitList[index][1],
            onChange: (value) => checkBoxTapped(value, index),
            settingsTapped: (context) => openHabitSetting(index),
            deleteTapped: (context) => deleteHabit(index),
          );
        },
      ),
    );
  }
}
