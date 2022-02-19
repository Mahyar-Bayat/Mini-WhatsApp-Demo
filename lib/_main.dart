import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this , duration: const Duration(milliseconds: 1500));

    animation = Tween(begin: 100.0 , end: 300.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    controller.addListener(() {
      if(controller.isCompleted) {
        controller.reverse();
      } else if(controller.isDismissed) {
        controller.stop();
      }
    });
//    controller.forward();
  }

  Widget _animationBuilder(BuildContext context , Widget? child) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: animation.value,
      width: animation.value,
      child: const FlutterLogo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'WhatsApp',
        home : Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedBuilder(
                    animation: controller,
                    builder: _animationBuilder
                ),
                RaisedButton(onPressed: () {
                  controller.forward();
                } , child: const Text('run'),)
              ],
            ),
          ),
        )
    );
  }
}
