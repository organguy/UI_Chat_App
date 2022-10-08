import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_chat_app/config/theme.dart';
import 'package:ui_chat_app/screens/chat_screen.dart';
import 'package:ui_chat_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat App UI',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/chat', page: () => const ChatScreen())
      ],
    );
  }
}
