
import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../models/message_model.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    Key? key,
    required this.chat,
    required this.scrollController
  }) : super(key: key);

  final Chat chat;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          reverse: true,
          controller: scrollController,
          itemCount: chat.messages.length,
          itemBuilder: (context, index){
            Message message = chat.messages[index];
            return Align(
              alignment: (message.senderId == '1')
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.66,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (message.senderId == '1')
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
                ),
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  message.text,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          }
      ),
    );
  }
}