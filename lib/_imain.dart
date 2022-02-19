import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, home: AnimationDemo()));

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  _playAnimation() async {
    try {
      await controller.forward();
      await controller.reverse();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Demo'),
      ),
      body: GestureDetector(
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(color: Colors.black.withOpacity(0.5))),
            child: StaggerAnimation(
              controller: controller.view,
            ),
          ),
        ),
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius?> borderRadius;
  final Animation<Color?> color;

  StaggerAnimation({Key? key, required this.controller})
      : opacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.100, curve: Curves.ease))),
        width = Tween<double>(begin: 50.0, end: 150.0).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.125, 0.250, curve: Curves.ease))),
        height = Tween<double>(begin: 50.0, end: 150.0).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.250, 0.375, curve: Curves.ease))),
        padding = EdgeInsetsTween(
                begin: const EdgeInsets.only(bottom: 16),
                end: const EdgeInsets.only(bottom: 75))
            .animate(CurvedAnimation(
                parent: controller,
                curve: const Interval(0.250, 0.375, curve: Curves.ease))),
        borderRadius = BorderRadiusTween(
                begin: BorderRadius.circular(4), end: BorderRadius.circular(75))
            .animate(CurvedAnimation(
                parent: controller,
                curve: const Interval(0.375, 0.500, curve: Curves.ease))),
        color = ColorTween(begin: Colors.indigo[100], end: Colors.orange[400])
            .animate(CurvedAnimation(
                parent: controller,
                curve: const Interval(0.500, 0.750, curve: Curves.ease))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: buildAnimation);
  }

  Widget buildAnimation(BuildContext context, Widget? child) {
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
              color: color.value,
              border:
                  Border.all(color: Colors.indigo.withOpacity(0.3), width: 3),
              borderRadius: borderRadius.value),
        ),
      ),
    );
  }
}
