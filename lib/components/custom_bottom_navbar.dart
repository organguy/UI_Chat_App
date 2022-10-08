import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {

  const CustomBottomNavBar({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 65,
        width: width * 0.5,
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Theme.of(context).colorScheme.secondary.withAlpha(150)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.message_rounded),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.person_add_rounded),
              ),
            )
          ],
        ),
      ),
    );
  }
}
