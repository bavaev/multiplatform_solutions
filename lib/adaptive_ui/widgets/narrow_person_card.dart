import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NarrowPersonCard extends StatelessWidget {
  final Map<String, dynamic> user;
  const NarrowPersonCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
              child: CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () => Navigator.of(context).pop(),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.person,
                          size: 50,
                        ),
                        Text(
                          'VIEW PROFILE',
                          style: TextStyle(
                            fontSize: 30,
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
                  CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () => Navigator.of(context).pop(),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.supervisor_account,
                          size: 50,
                        ),
                        Text(
                          'FRIENDS',
                          style: TextStyle(
                            fontSize: 30,
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
                  CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () => Navigator.of(context).pop(),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.sticky_note_2_outlined,
                          size: 50,
                        ),
                        Text(
                          'REPORT',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              onWillPop: () async {
                return false;
              });
        },
      ),
      child: Container(
        margin: const EdgeInsets.all(5),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(right: 25),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/wpua.png'),
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user['name'],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user['email'],
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
