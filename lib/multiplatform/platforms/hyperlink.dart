import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hyperlink extends StatelessWidget {
  final String link;
  const Hyperlink({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => launchUrl(Uri.parse(link))),
      child: Center(
        child: Text(
          link,
          style: const TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
