import 'package:flutter/material.dart';
import 'package:mini_whats_app_demo/models/chat_model.dart';
import 'call_screen.dart';

class SingleChatScreen extends StatelessWidget {
  final ChatModel data;

  SingleChatScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: const Color(0xff888888),
                  backgroundImage: NetworkImage(data.avatarUrl),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  data.name,
                  style: const TextStyle(fontSize: 17),
                )
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("صفحه چت " + data.name,
                    style: const TextStyle(fontSize: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CallScreen()));
                        },
                        icon: const Icon(Icons.arrow_back)),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context, "چه ژست زشتی؟؟؟${data.name}");
                        },
                        icon: const Icon(Icons.arrow_forward)),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
