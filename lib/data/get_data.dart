import 'package:flutter/services.dart';

Future<String> fetchFile() async {
  try {
    return await rootBundle.loadString('assets/users.json');
  } catch (e) {
    return 'Error';
  }
}
