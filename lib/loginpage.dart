import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/homepage.dart';
import 'package:records/userfields.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LogIN"),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Userfields(
              hintText: 'Name',
              secure: false,
              controller: name,
            ),
            SizedBox(height: 15),
            Userfields(
              hintText: 'Password',
              controller: pass,
              secure: false,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                if (name.text.isNotEmpty && pass.text.isNotEmpty) {
                  if (name.text == "good1@gmail.com" && pass.text == "happy") {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Homepage(text: "Welcome, good1@gmail.com",
                              userId: name.text
                            ),
                      ),
                    );
                  } else if (name.text == "happy2@gmail.com" &&
                      pass.text == "good") {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Homepage(text: "Welcome, happy2@gmail.com",
                                userId: name.text
                            ),
                      ),
                    );
                  } else {
                    if (kDebugMode) {
                      print("Incorrect credentials");
                    }
                  }
                } else {
                  if (kDebugMode) {
                    print("Missing Fields");
                  }
                }
              },
              child: const Text("LogIn"),
            ),
          ],
        ),
      ),
    );
  }
}
