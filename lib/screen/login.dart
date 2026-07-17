
import 'package:flutter/material.dart';
import 'package:myproject_01/screen/reg.dart';
import 'package:myproject_01/screen/home.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            "https://png.pngtree.com/thumb_back/fh260/background/20240421/pngtree-blue-water-splash-wave-screen-background-image_15717616.jpg",
            height: 250,
            width: 450,
            fit: BoxFit.cover,
          ),
          Text("Log In Here",
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),
          ),
          MyTextField(email: email),
          MyTextField(email: email),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                  labelText: "PassWord",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Show/Hide password
                    },
                    icon: const Icon(Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if(email.text == "trp@gmail.com" && password.text == "1234594"){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              }else{
                //log("=======Message====");
                //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Email/Password")));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: const [
                        Icon(Icons.error_outline, color: Colors.white),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Wrong Email or Password",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.red.shade600,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.all(15),
                    elevation: 8,
                    duration: const Duration(seconds: 3),
                    action: SnackBarAction(
                      label: "Retry",
                      textColor: Colors.yellow,
                      onPressed: () {
                        // Retry action
                      },
                    ),
                  ),
                );
              }

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
              Text("Not Register Yet?"),
              InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegScreen()));
                  },
                  child: Text("Register Now", style: TextStyle(color:Colors.blue),)
              )
            ],
          ),

        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.email,
  });

  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: email,
        decoration: InputDecoration(
            labelText: "Email",
            prefixIcon: Icon(Icons.person),
            suffixIcon: Icon(Icons.email),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
            )
        ),
      ),
    );
  }
}
