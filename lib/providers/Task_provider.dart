// import 'dart:ffi';

import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';
import '../models/task.dart';

class Items extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Task> _items = [];

  List<Task> get items {
    return [..._items];
  }

  void add(String title) {
    _items.add(Task(title: title, id: DateTime.now().toString()));
    notifyListeners();
  }

  void delete(Task task) {
    _items.remove(task);
    notifyListeners();
  }

  void clean() {
    _items.removeWhere((task) => task.check == true);
    notifyListeners();
  }

  void checkTask(Task task) {
    task.toggletask(task);
    notifyListeners();
  }
}
