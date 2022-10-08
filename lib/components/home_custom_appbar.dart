
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const HomeCustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Chats',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: (){
            Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark
            );
          },
          icon: Icon(Get.isDarkMode ? Icons.dark_mode : Icons.light_mode),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}