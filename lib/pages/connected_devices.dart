import 'package:flutter/material.dart';
import 'package:mini_whats_app_demo/pages/call_screen.dart';

class ConnectedDevices extends StatefulWidget {
  const ConnectedDevices({Key? key}) : super(key: key);

  @override
  State<ConnectedDevices> createState() => _ConnectedDevicesState();
}

class _ConnectedDevicesState extends State<ConnectedDevices> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'دستگاه های متصل',
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'دستگاه های متصل',
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
