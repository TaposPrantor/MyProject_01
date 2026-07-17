import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  MyTextWidget({
    super.key, required this.title, this.tSize, this.tColor, this.mLine
  });

  String title;
  double? tSize;
  Color? tColor;
  int? mLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: mLine ?? 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: tColor ?? Colors.blue,
        fontSize: tSize ?? 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}