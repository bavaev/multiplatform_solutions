import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (() => Navigator.of(context).pop()),
          child: Row(
            children: const [
              Icon(
                Icons.person,
                size: 40,
              ),
              Text(
                'VIEW PROFILE',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 3,
          color: Colors.black,
        ),
        InkWell(
          onTap: (() => Navigator.of(context).pop()),
          child: Row(
            children: const [
              Icon(
                Icons.supervisor_account,
                size: 40,
              ),
              Text(
                'FRIENDS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 3,
          color: Colors.black,
        ),
        InkWell(
          onTap: (() => Navigator.of(context).pop()),
          child: Row(
            children: const [
              Icon(
                Icons.sticky_note_2_outlined,
                size: 40,
              ),
              Text(
                'REPORT',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
