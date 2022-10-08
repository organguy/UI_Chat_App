



import 'package:flutter/material.dart';

import '../models/user_model.dart';

class HomeChatContacts extends StatelessWidget {
  const HomeChatContacts({
    Key? key,
    required this.height,
    required this.users,
  }) : super(key: key);

  final double height;
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: height * 0.160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (context, index){
          User user = users[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: double.maxFinite,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(user.imageUrl),
                ),
                const SizedBox(height: 10,),
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}