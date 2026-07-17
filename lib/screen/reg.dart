import 'package:flutter/material.dart';
import 'package:myproject_01/custom_widget/text_field.dart';
import 'login.dart';



class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {

  TextEditingController name  = TextEditingController();
  TextEditingController phone  = TextEditingController();
  TextEditingController email  = TextEditingController();
  TextEditingController password  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            "https://png.pngtree.com/thumb_back/fh260/background/20240421/pngtree-blue-water-splash-wave-screen-background-image_15717616.jpg",
            height: 150,
            width: 450,
            fit: BoxFit.cover,
          ),
          Text("REGISTER Here",
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),
          ),
          MyTextField(email: name, hint: "Enter Your Name"),
          MyTextField(email: phone, hint: "Enter Your Number"),
          MyTextField(email: email, hint: "Enter Your Email"),
          MyTextField(email: password, hint: "Enter Your PassWord", obscureText: true,),
          InkWell(
            onTap: () {
            },
            child: Card(
              margin: EdgeInsets.all(7),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Log IN", style: TextStyle(color:Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [
              Text("AlReady Registered?"),
              InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text("Login Now", style: TextStyle(color:Colors.blue),)
              )
            ],
          ),
        ],
      ),
    );
  }
}
