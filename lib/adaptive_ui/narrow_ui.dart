import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:multiplatform_solutions/data/get_data.dart';

import 'wide_ui.dart';

class AdaptiveUI extends StatefulWidget {
  AdaptiveUI({Key? key}) : super(key: key);

  @override
  State<AdaptiveUI> createState() => _AdaptiveUIState();
}

class _AdaptiveUIState extends State<AdaptiveUI> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => constraints.maxWidth > 720
          ? AdaptiveUIWide()
          : Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: double.infinity,
                    color: Colors.cyan,
                    child: const Text(
                      'Adaptive App',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: fetchFile(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<dynamic> users = jsonDecode(snapshot.data);
                        return Expanded(
                          child: ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, index) {
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
                                              users[index]['name'],
                                              style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              users[index]['email'],
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
                            },
                          ),
                        );
                      }
                      return const Center(
                        child: Text('Users not found!'),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
