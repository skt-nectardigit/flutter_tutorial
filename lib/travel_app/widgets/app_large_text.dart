import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  String text;
  Color? color;
  AppLargeText({Key? key, required this.text, this.color = Colors.black})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 30, color: color, fontWeight: FontWeight.bold),
    );
  }
}
