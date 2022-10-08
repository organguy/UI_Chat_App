import 'package:flutter/material.dart';
import 'package:ui_chat_app/components/home_custom_appbar.dart';
import '../components/home_chat_contacts.dart';
import '../components/home_chat_messages.dart';
import '../components/custom_bottom_navbar.dart';
import '../models/chat_model.dart';
import '../models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<User> users = User.users;
    List<Chat> chats = Chat.chats;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ]
        )
      ),
      child: Scaffold(
        appBar: const HomeCustomAppBar(),
        body: Column(
          children: [
            HomeChatContacts(height: height, users: users),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  HomeChatMessages(chats: chats),
                  CustomBottomNavBar(width: width),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}








