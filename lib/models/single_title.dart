// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/Task_provider.dart';

// ignore: must_be_immutable
class SingleTitle extends StatelessWidget {
  Task task;
  // final Task def  = Task();
  SingleTitle({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Icon(Icons.task),
      title: task.check
          ? Text(
              task.title,
              style: const TextStyle(
                  decoration: TextDecoration.lineThrough, fontSize: 20),
            )
          : Text(
              task.title,
              // style: TextStyle(fontFamily: "kopi", fontSize: 20),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
      trailing: Checkbox(
        value: task.check,
        onChanged: (value) {
          Provider.of<Items>(context, listen: false).checkTask(task);
        },
      ),
    );
  }
}
