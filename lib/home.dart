import 'package:flutter/material.dart';
import 'package:mini_whats_app_demo/pages/call_screen.dart';
import 'package:mini_whats_app_demo/pages/camera_screen.dart';
import 'package:mini_whats_app_demo/pages/chat_screen.dart';
import 'package:mini_whats_app_demo/pages/connected_devices.dart';
import 'package:mini_whats_app_demo/pages/create_chat_screen.dart';
import 'package:mini_whats_app_demo/pages/new_group.dart';
import 'package:mini_whats_app_demo/pages/new_list.dart';
import 'package:mini_whats_app_demo/pages/settings_screen.dart';
import 'package:mini_whats_app_demo/pages/star_messages.dart';
import 'package:mini_whats_app_demo/pages/status_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late Map<String, SliverAppBar> appBarList;
  String _currentAppBar = 'mainAppBar';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(initialIndex: 1, length: 4, vsync: this);

    SliverAppBar mainAppBar = SliverAppBar(
      elevation: 6,
      title: const Text('واتساپ'),
      pinned: true,
      floating: true,
      // backgroundColor: const Color(0xffc9139f),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                _currentAppBar = 'searchAppBar';
              });
            },
            icon: const Icon(Icons.search)),
        PopupMenuButton<String>(onSelected: (String choice) {
         // print(choice);
          if (choice == 'settings') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()));
          } else if (choice == 'new_group') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewGroup()));
          } else if (choice == 'new_list') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewList()));
          } else if (choice == 'connected_devices') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ConnectedDevices()));
          } else if (choice == 'star_messages') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const StarMessages()));
          }
        }, itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
                value: 'new_group',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[Text('گروه جدید')],
                )),
            PopupMenuItem(
                value: 'new_list',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[Text('لیست انتشار جدید')],
                )),
            PopupMenuItem(
                value: 'connected_devices',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[Text('دستگاه های متصل')],
                )),
            PopupMenuItem(
                value: 'star_messages',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[Text('پیام های ستاره دار')],
                )),
            PopupMenuItem(
                value: 'settings',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('تنظیمات'),
                  ],
                )),
          ];
        })
      ],
      bottom: TabBar(
        controller: tabController,
        indicatorColor: Colors.white,
        tabs: const <Widget>[
          Tab(icon: Icon(Icons.camera_alt)),
          Tab(
            text: 'گفتگو ها',
          ),
          Tab(
            text: 'وضعیت',
          ),
          Tab(
            text: 'تماس ها',
          ),
        ],
      ),
    );
    SliverAppBar searchAppBar = SliverAppBar(
      pinned: true,
      floating: true,
      elevation: 6,
      title: const TextField(
        decoration:
            InputDecoration(border: InputBorder.none, hintText: 'جستجو'),
      ),
      backgroundColor: Colors.white,
      // backgroundColor: const Color(0xffc9139f),
      leading: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          child: const Icon(Icons.arrow_back, color: Colors.blueGrey),
          onTap: () {
            setState(() {
              _currentAppBar = 'mainAppBar';
            });
          },
        ),
      ),
    );

    appBarList = <String, SliverAppBar>{
      'mainAppBar': mainAppBar,
      'searchAppBar': searchAppBar,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: appBarList[_currentAppBar],
              )
            ];
          },
          body: _currentAppBar == 'mainAppBar'
              ? TabBarView(controller: tabController, children: const <Widget>[
                  CameraScreen(),
                  ChatScreen(),
                  StatusScreen(),
                  CallScreen(),
                ])
              : const Center(
                  child: Text('Search'),
                )),
      // appBar: AppBar(
      //   elevation: 6,
      //   title: const Text('واتساپ'),
      //   // backgroundColor: const Color(0xffc9139f),
      //   bottom: TabBar(
      //     controller: tabController,
      //     indicatorColor: Colors.white,
      //     tabs: const <Widget>[
      //       Tab(icon: Icon(Icons.camera_alt)),
      //       Tab(
      //         text: 'گفتگو ها',
      //       ),
      //       Tab(
      //         text: 'وضعیت',
      //       ),
      //       Tab(
      //         text: 'تماس ها',
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           setState(() {
      //             print(const Text('HiHi'));
      //           });
      //         },
      //         icon: const Icon(Icons.search)),
      //     PopupMenuButton<String>(onSelected: (String choice) {
      //       print(choice);
      //     }, itemBuilder: (BuildContext context) {
      //       return [
      //         PopupMenuItem(
      //             value: 'new_group',
      //             child:  Row(
      //               mainAxisAlignment:  MainAxisAlignment.center,
      //               children: const <Widget>[
      //                 Text('گروه جدید')
      //               ],
      //             )
      //         ),
      //         PopupMenuItem(
      //             value: 'new_list',
      //             child:  Row(
      //               mainAxisAlignment:  MainAxisAlignment.center,
      //               children: const <Widget>[
      //                 Text('لیست انتشار جدید')
      //               ],
      //             )
      //         ),
      //         PopupMenuItem(
      //             value: 'connected_devices',
      //             child:  Row(
      //               mainAxisAlignment:  MainAxisAlignment.center,
      //               children: const <Widget>[
      //                 Text('دستگاه های متصل')
      //               ],
      //             )
      //         ),
      //         PopupMenuItem(
      //             value: 'star_messages',
      //             child:  Row(
      //               mainAxisAlignment:  MainAxisAlignment.center,
      //               children: const <Widget>[
      //                 Text('پیام های ستاره دار')
      //               ],
      //             )
      //         ),
      //         PopupMenuItem(
      //             value: 'settings',
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: const [
      //                 Text('تنضیمات'),
      //               ],
      //             )),
      //       ];
      //     })
      //   ],
      // ),
      // body: TabBarView(controller: tabController, children: const <Widget>[
      //   CameraScreen(),
      //   ChatScreen(),
      //   StatusScreen(),
      //   CallScreen(),
      // ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateChatScreen()));
        },
      ),
    );
  }
}
