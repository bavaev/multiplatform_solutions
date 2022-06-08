import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import 'menu.dart';

class WidePersonCard extends StatelessWidget {
  final Map<String, dynamic> user;

  const WidePersonCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopover(
          context: context,
          bodyBuilder: (context) => const Menu(),
          height: 180,
        );
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(5, 5),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 4,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/wpua.png'),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                user['name'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                user['email'],
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
