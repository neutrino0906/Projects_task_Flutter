// import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String title;
  bool check;

  Task({this.id = "0", this.title = "", this.check = false});

  void toggletask(Task task) {
    task.check = !task.check;
  }
}
