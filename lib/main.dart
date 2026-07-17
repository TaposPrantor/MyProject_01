import 'package:flutter/material.dart';
import 'package:myproject_01/screen/custom_text.dart';
import 'package:myproject_01/screen/login.dart';
import 'package:myproject_01/screen/reg.dart';
import 'package:myproject_01/screen/splashscreen.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomTextScreen(),
    );
  }
}
