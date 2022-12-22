// import 'dart:ui';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../models/task.dart';

import 'single_title.dart';
import '../providers/Task_provider.dart';
// import 'package:provider/provider.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  // List<Task> _items = itemsL;
  // void

  @override
  Widget build(BuildContext context) {
    return Consumer<Items>(
      // child: Text("No data to show!!"),
      builder: ((context, value, child) => value.items.length <= 0
          ? Center(
              child: Column(
              children: [
                Lottie.network(
                    "https://assets1.lottiefiles.com/packages/lf20_lFRXJJKwS5.json"),
                const Text(
                  "No data to show",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 40,
                      fontFamily: "kopi"),
                ),
              ],
            ))
          : ListView.builder(
              padding: const EdgeInsets.only(left: 25, top: 15),
              itemCount: value.items.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () => value.checkTask(value.items[index]),
                  child: SingleTitle(task: value.items[index]),
                  onLongPress: () => value.delete(value.items[index]),
                );
              }),
            )),
    );
  }
}
