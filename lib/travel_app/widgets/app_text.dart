import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  AppText({Key? key, required this.text, this.color = Colors.black54, this.size=30})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300,
      child: Text(
        text,
        style: TextStyle(fontSize: size, color: color,),
      ),
    );
  }
}
