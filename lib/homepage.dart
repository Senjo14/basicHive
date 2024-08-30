import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class Homepage extends StatefulWidget {
  final String text;
  final String userId;

  const Homepage({super.key, required this.text, required this.userId});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int userValue = 0;

  late Box<int> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box<int>("collection");
    userValue = box.get(widget.userId,defaultValue: 0)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Get.toNamed("/login");
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            userValue.toString(),
            style: TextStyle(fontSize: 25),
          )),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  userValue++;
                  box.put(widget.userId, userValue);
                });
              },
              child: const Text(
                "Add Value",
                style: TextStyle(fontSize: 30),
              ))
        ],
      ),
    );
  }
}
