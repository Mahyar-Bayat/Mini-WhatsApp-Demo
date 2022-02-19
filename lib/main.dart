import 'package:flutter/material.dart';
import 'package:mini_whats_app_demo/pages/login_screen.dart';
import 'home.dart';
import 'pages/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "واتساپ",
        theme: ThemeData(fontFamily: 'Vazir', primarySwatch: Colors.blueGrey),
        initialRoute: "/splash_screen",
        routes: {
          "/": (context) => const Directionality(
              textDirection: TextDirection.rtl, child: Home()),
          "/splash_screen": (context) => const Directionality(
              textDirection: TextDirection.rtl, child: SplashScreen()),
          "/login_screen": (context) => const Directionality(
              textDirection: TextDirection.rtl, child: LoginScreen()),
          // "/setting" : (context) => SettingScreen(),
          // "/new_chat" : (context) => CreateChatScreen(),
        });
  }
}
