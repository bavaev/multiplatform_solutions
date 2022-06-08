import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:multiplatform_solutions/data/get_data.dart';
import 'package:multiplatform_solutions/adaptive_ui/widgets/wide_person_card.dart';

class AdaptiveUIWide extends StatefulWidget {
  const AdaptiveUIWide({Key? key}) : super(key: key);

  @override
  State<AdaptiveUIWide> createState() => _AdaptiveUIWideState();
}

class _AdaptiveUIWideState extends State<AdaptiveUIWide> {
  late Future data;

  @override
  void initState() {
    super.initState();
    data = fetchFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(15),
              height: double.infinity,
              color: Colors.cyan,
              child: const Text(
                'Adaptive App',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<dynamic> users = jsonDecode(snapshot.data);
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return WidePersonCard(user: users[index]);
                    },
                  );
                }
                return const Center(
                  child: Text('Users not found!'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
