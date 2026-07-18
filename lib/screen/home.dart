import 'package:flutter/material.dart';
import 'package:myproject_01/custom_widget/text_field.dart';
import 'package:myproject_01/custom_widget/text_widget.dart';

import '../database/notes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyTextWidget(title: "My Notes App", tColor: Colors.blue),
        backgroundColor: Color(0xff27F5E4),
      ),
      body: ListView.builder(
        itemCount: NoteData.note.length,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                  //backgroundColor: Colors.greenAccent,
                  title: MyTextWidget(title: "${NoteData.note[i]['title']}"),
                  content: MyTextWidget(
                    title: "${NoteData.note[i]["details"]}", mLine: 30,
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button color
                        foregroundColor: Colors.white, // Text color
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK"),
                    ),
                  ],
                ),
              );
            },
            onLongPress: () {
              NoteData.note.removeAt(i);
              setState(() {});
            },
            leading: CircleAvatar(child: MyTextWidget(title: "${i + 1} ")),
            tileColor: Colors.grey.shade300,
            title: MyTextWidget(title: "${NoteData.note[i]['title']}"),
            subtitle: MyTextWidget(
              title: "${NoteData.note[i]['details']}",
              mLine: 3,
            ),
            trailing: InkWell(
              onTap: () {
                title.text = "${NoteData.note[i]['title']}";
                details.text = "${NoteData.note[i]['details']}";
                showDialog(
                  barrierDismissible: false,
                    context: context, builder: (context) => AlertDialog(
                  title: MyTextWidget(title: "Update Your Data"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyTextField(email: title, hint: "Enter Your Title"),
                      MyTextField(email: details, hint: "Enter Your details"),
                    ],
                  ),
                  actions: [
                    ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text("Cancel")),

                    ElevatedButton(onPressed: () {
                      if (title.text.isEmpty || details.text.isEmpty) {
                        return;
                      }
                      NoteData.note[i]['title'] = title.text;
                      NoteData.note[i]['details'] = details.text;
                      setState(() {});
                      Navigator.pop(context);
                    }, child: Text("Save"))
                  ],
                  
                )
                );
                // NoteData.note[i]['title'] = "tour";
                // NoteData.note[i]['details'] = "Cost 40";
                // setState(() {
                //  
                // });
              },
              child: Icon(Icons.edit_note, color: Colors.black87),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          title.clear();
          details.clear();
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              title: MyTextWidget(title: "Add Your Note"),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyTextField(email: title, hint: "Enter Title"),
                    MyTextField(
                      email: details,
                      hint: "Enter Note Details",
                      mLine: 3,
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("Cancel")),

                ElevatedButton(
                  onPressed: () {
                    if (title.text.isEmpty || details.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Give Data")));
                      return;
                    }
                    NoteData.note.add({
                      "title": title.text,
                      "details": details.text,
                    });
                    setState(() {});
                    title.clear();
                    details.clear();
                    Navigator.pop(context);
                  },
                  child: Text("Add"),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
