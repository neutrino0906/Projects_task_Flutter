import 'package:flutter/material.dart';
import '../main.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

double opacityLevel = 1;

class _MyWidgetState extends State<MyWidget> {
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Sca()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.lightBlue,
          child: Center(
            // child: FadeTransition(
            child: Image.asset(
              "assets/Projectyy_Icon.png",
              height: MediaQuery.of(context).size.width * 0.7,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            // opacity: Tween<double>(begin: 0.0, end: 0.1).animate,
            // ),
            //     child: AnimatedOpacity(
            //   opacity: opacityLevel == 1 ? 0 : 1,
            //   // curve: Curves.easeOut,
            //   duration: const Duration(seconds: 1, milliseconds: 800),
            //   child: AnimatedPositioned(
            //     right: 100,
            //     curve: Curves.easeOut,
            //     duration: const Duration(seconds: 2),
            //     child: Image.asset(
            //       "assets/Projectyy_Icon.png",
            //       height: MediaQuery.of(context).size.width * 0.7,
            //       width: MediaQuery.of(context).size.width * 0.7,
            //     ),
            //   ),
            // )
          )),
    );
  }
}
