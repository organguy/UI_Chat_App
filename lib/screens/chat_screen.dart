import 'package:flutter/material.dart';
import 'package:ui_chat_app/components/chat_custom_appbar.dart';
import 'package:ui_chat_app/components/custom_container.dart';
import 'package:ui_chat_app/models/chat_model.dart';
import 'package:ui_chat_app/models/message_model.dart';
import '../components/chat_messages.dart';
import '../models/user_model.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  late User user;
  late Chat chat;
  late String text;

  @override
  void initState() {
    user = Get.arguments[0];
    chat = Get.arguments[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        appBar: ChatCustomAppBar(user: user,),
        body: CustomContainer(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ChatMessages(
                chat: chat,
                scrollController: scrollController,
              ),
              TextFormField(
                controller: textEditingController,
                onChanged: (value){
                  setState(() {
                    text = value;
                    debugPrint(text);
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary.withAlpha(150),
                  hintText: 'Type here ...',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none
                  ),
                  contentPadding: const EdgeInsets.all(20.0),
                  suffixIcon: IconButton(
                    onPressed: (){
                      Message message = Message(senderId: '1', recipientId: user.id, text: text, createdAt: DateTime.now());
                      List<Message> messages = List.from(chat.messages)..add(message);
                      messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));
                      setState(() {
                        chat = chat.copyWith(messages: messages);
                      });

                      scrollController.animateTo(
                          scrollController.position.minScrollExtent,
                          duration: const Duration(microseconds: 200),
                          curve: Curves.easeIn
                      );

                      textEditingController.clear();
                    },
                    icon: const Icon(Icons.send),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



