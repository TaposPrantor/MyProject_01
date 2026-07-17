import 'package:flutter/material.dart';

class CustomTextScreen extends StatefulWidget {
  const CustomTextScreen({super.key});

  @override
  State<CustomTextScreen> createState() => _CustomTextScreenState();
}

class _CustomTextScreenState extends State<CustomTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Widget")),
      body: Column(
        children: [
          MyTextWidget(title: "CoderAngon1", tSize: 10,),
          MyTextWidget(title: "CoderAngon2", tColor: Colors.deepPurple,),
          MyTextWidget(title: "CoderAngon3", tSize: 12,tColor: Colors.purple,),
          MyTextWidget(title: "CoderAngon4", tSize: 10,),
          MyTextWidget(title: "CoderAngon5",  tColor: Colors.pink,),
        ],
      ),
    );
  }
}

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
        color: tColor ?? Colors.green,
        fontSize: tSize ?? 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
