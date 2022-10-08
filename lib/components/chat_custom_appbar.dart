
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ChatCustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const ChatCustomAppBar({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            '${user.name} ${user.surname}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5,),
          Text(
            'Online',
            style: Theme.of(context).textTheme.bodySmall,
          )

        ],
      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.imageUrl),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(56.0);
  }
}