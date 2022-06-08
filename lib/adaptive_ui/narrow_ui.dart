import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/adaptive_ui/widgets/narrow_person_card.dart';

import 'package:multiplatform_solutions/data/get_data.dart';

import 'wide_ui.dart';
import 'widgets/narrow_person_card.dart';

class AdaptiveUINarrow extends StatefulWidget {
  const AdaptiveUINarrow({Key? key}) : super(key: key);

  @override
  State<AdaptiveUINarrow> createState() => _AdaptiveUINarrowState();
}

class _AdaptiveUINarrowState extends State<AdaptiveUINarrow> {
  late Future data;

  @override
  void initState() {
    super.initState();
    data = fetchFile();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => constraints.maxWidth > 720
          ? const AdaptiveUIWide()
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
                    future: data,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<dynamic> users = jsonDecode(snapshot.data);
                        return Expanded(
                          child: ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              return NarrowPersonCard(user: users[index]);
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
