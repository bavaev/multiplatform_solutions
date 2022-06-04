import 'package:flutter/material.dart';

import 'multiplatform/view.dart';
import 'adaptive_ui/narrow_ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiplatform Solutions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/view': (context) => View(),
        '/adaptiveUI': ((context) => AdaptiveUI()),
      },
      home: Builder(
        builder: (context) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/view'),
                    child: const Text('Multiplatform'),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/adaptiveUI'),
                    child: const Text('Adaptive UI'),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}