import 'package:flutter/material.dart';
import 'package:mini_whats_app_demo/pages/call_screen.dart';

class StarMessages extends StatefulWidget {
  const StarMessages({Key? key}) : super(key: key);

  @override
  State<StarMessages> createState() => _StarMessagesState();
}

class _StarMessagesState extends State<StarMessages> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'پیام های ستاره دار',
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'پیام های ستاره دار',
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
