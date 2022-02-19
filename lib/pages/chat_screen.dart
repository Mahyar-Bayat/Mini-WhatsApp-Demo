import 'package:flutter/material.dart';
import 'package:mini_whats_app_demo/models/chat_model.dart';
import 'package:mini_whats_app_demo/pages/single_chat_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: dummyData.length ,
        itemBuilder: (context , index) {
          return Padding(padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              const Divider(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  _navigateAndDisplaySomeMessage(context , dummyData[index]);
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SingleChatScreen(data : dummyData[index]))
                  );*/
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(dummyData[index].avatarUrl),
                    backgroundColor: Colors.grey,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    children: <Widget>[
                      Text(
                        dummyData[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        dummyData[index].time,
                        style: const TextStyle(color: Colors.grey , fontSize: 14),
                      )
                    ],
                  ),
                  subtitle: Container(
                    padding : const EdgeInsets.only(top: 5),
                    child: Text(
                      dummyData[index].message,
                      style: const TextStyle(color: Colors.grey , fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),);
        }
    );
  }

  _navigateAndDisplaySomeMessage(BuildContext context ,ChatModel data) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SingleChatScreen(data : data))
    );

    Scaffold.of(context).showSnackBar(SnackBar(content: Text(result , style: const TextStyle(fontFamily: 'Vazir'),)));
  }

}