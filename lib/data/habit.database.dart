import 'package:habittacker/date_time/date.time.dart';
import 'package:hive_flutter/adapters.dart';

// reference our box
final _myBox = Hive.box("Habit_Database");

class HabitDatabase {
  List todayHabitList = [];

  // create inital default data
  void createDefaultData() {
    todayHabitList = [
      ["Run", false],
      ["Read", false],
    ];

    _myBox.put("START_DATE", todayDateFormatted());
  }

  // load data if it already exists
  void loadData() {
    // if it's a new day, get habit list from database
    if (_myBox.get(todayDateFormatted()) == null) {
      todayHabitList = _myBox.get("CURRENT_HABIT_LIST");

      // set all habit completed to false since it's a new day
      for (int i = 0; i < todayHabitList.length; i++) {
        todayHabitList[i][1] = false;
      }
    }
    // if it's not a new day, load todays list
    else {
      todayHabitList = _myBox.get(todayDateFormatted());
    }
  }

  // update database
  void updateDatabase() {
    // update todays entry
    _myBox.put(todayDateFormatted(), todayHabitList);

    // update universal habit list in case it changed (new habit, edit habit, delete habit)
    _myBox.put("CURRENT_HABIT_LIST", todayHabitList);
  }
}
