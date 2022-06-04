import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

import 'platforms/app_platform.dart';
import 'platforms/hyperlink.dart';

class View extends StatefulWidget {
  View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  TextEditingController controller = TextEditingController();
  String url = '';

  Future _getPage() async {
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return [response.body, url];
      }
    } catch (e) {
      print('Error! $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder(
              future: _getPage(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Flexible(
                    flex: 11,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data[0].split('<title>')[1].split('</title>')[0].trim(),
                          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'CORS Header: None',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                            child: AppPlatform.isMobile
                                ? WebView(
                                    initialUrl: url,
                                    javascriptMode: JavascriptMode.unrestricted,
                                  )
                                : Hyperlink(link: url)),
                      ],
                    ),
                  );
                } else {
                  return const Flexible(
                    flex: 11,
                    child: Center(
                      child: Text('Page not found!'),
                    ),
                  );
                }
              },
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          flex: 4,
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Введите ссылку на сайт',
                            ),
                            onSubmitted: (String value) {
                              setState(() {
                                url = value;
                              });
                            },
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            color: Colors.blue,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(3),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  url = controller.text;
                                });
                              },
                              child: const Text(
                                'LOAD',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'APPLICATION RUNNING ON ${kIsWeb ? 'WEB' : Platform.operatingSystem.toUpperCase()}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
