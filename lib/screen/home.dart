import 'package:flutter/material.dart';
import 'package:myproject_01/custom_widget/text_widget.dart';

import '../database/notes.dart';

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
      body: ListView.builder(
        itemCount: NoteData.note.length,
          itemBuilder: (context, i)=> Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              leading: CircleAvatar(child: MyTextWidget(title: "${i+1} "),),
              tileColor: Colors.grey.shade300,
              title: MyTextWidget(title: "${NoteData.note[i]['title']}"),
              subtitle: MyTextWidget(title: "${NoteData.note[i]['details']}"),
              trailing: InkWell(
                onTap: () {
                  NoteData.note.removeAt(i);
                  setState(() {

                  });
                },
                child: Icon(Icons.delete, color: Colors.red,),
              ),
            ),
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () async{
        showDialog(context: context, builder: (context)=>
            AlertDialog(
              title: MyTextWidget(title: "Alert Dialogue"),
              content: MyTextWidget(title: "Note Title"),
            )
        );


        // NoteData.note.add({"title" : "Adda", "details" : "Tea=40, Coffee=120"},);
        // setState(() {});
      }, child: Icon(Icons.add),),
    );
  }
}
