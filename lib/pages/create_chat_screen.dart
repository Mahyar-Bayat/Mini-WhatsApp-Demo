import 'package:flutter/material.dart';
import 'package:mini_whats_app_demo/pages/call_screen.dart';

class CreateChatScreen extends StatefulWidget {
  const CreateChatScreen({Key? key}) : super(key: key);

  @override
  State<CreateChatScreen> createState() => _CreateChatScreenState();
}

class _CreateChatScreenState extends State<CreateChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'انتخاب مخاطب',
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search))
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ایجاد چت',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const CallScreen()));
                      },
                      icon: const Icon(Icons.arrow_back)),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_forward)),
                ],
              ),
            ],
          )),
    );
  }
}
