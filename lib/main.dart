import 'package:flutter/material.dart';
import './Screens/Splash_screen.dart';
import './models/list_items.dart';
import 'package:provider/provider.dart';
// import './models/single_title.dart';
import './providers/Task_provider.dart';

// import 'providers/Task_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Items(),
      child: const MaterialApp(
        home: MyWidget(),
      ),
    );
  }
}

class Sca extends StatelessWidget {
  const Sca({super.key});

  // ignore: non_constant_identifier_names
  Widget BottomSheet(BuildContext ctx) {
    String _con = "";
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          const Text(
            "ADD TASK",
            style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 30,
                fontWeight: FontWeight.w500),
          ),
          TextField(
            decoration: const InputDecoration(hintText: "I want to do..."),
            onSubmitted: (val) {
              val == ""
                  ? ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
                      content: Text("Error: Empty task cannot be Added!")))
                  : Provider.of<Items>(ctx, listen: false).add(val);
              Navigator.of(ctx).pop();
            },
            autofocus: true,
            // controller: _con,
            onChanged: (val) {
              _con = val;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            onPressed: () {
              _con == ""
                  ? ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
                      content: Text("Error: Empty task cannot be Added!")))
                  : Provider.of<Items>(ctx, listen: false).add(_con);
              Navigator.of(ctx).pop();
            },
            icon: const Icon(Icons.task),
            label: const Text("Add Task"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          // onPressed: () => Provider.of<Items>(context, listen: false).add(),
          onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => BottomSheet(context)),
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
              width: double.infinity,
              // color: Colors.lightBlueAccent,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Projects",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "kopi",
                        fontSize: 70,
                        // fontWeight: FontWeight.w700
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.list),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "${Provider.of<Items>(context).items.length} Tasks",
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "supermolot",
                                fontSize: 20,
                                // fontWeight: FontWeight.w300
                              ),
                            ),
                          ],
                        ),
                        MaterialButton(
                          color: const Color.fromARGB(255, 66, 170, 255),
                          onPressed: () {
                            Provider.of<Items>(context, listen: false).clean();
                          },
                          child: const Text(
                            "Clean",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                  // width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(29),
                          topRight: Radius.circular(29))),
                  child: const ListItems()),
            )
          ],
        ));
  }
}
