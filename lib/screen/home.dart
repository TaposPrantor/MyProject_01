import 'package:flutter/material.dart';
import 'package:myproject_01/custom_widget/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyTextWidget(title: "My Notes App" , tColor: Colors.blue,),
        backgroundColor: Color(0xff27F5E4),
      ),

      body: GridView.builder(
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, i)=> Card(
            color: Colors.grey.shade300,
            child: Column(
              children: [
                MyTextWidget(title: "First"),
                MyTextWidget(title: "Second"),
                MyTextWidget(title: "Third"),
              ],
            ),
          )
      )
    );
  }
}
