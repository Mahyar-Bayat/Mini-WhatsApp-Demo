import 'package:flutter/material.dart';
import 'package:mini_whats_app_demo/pages/call_screen.dart';

class NewList extends StatefulWidget {
  const NewList({Key? key}) : super(key: key);

  @override
  State<NewList> createState() => _NewListState();
}

class _NewListState extends State<NewList> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'لیست جدید',
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'لیست جدید',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CallScreen()));
                      },
                      icon: Icon(Icons.arrow_back)),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_forward)),
                ],
              ),
            ],
          )),
    );
  }
}
