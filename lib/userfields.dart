import 'package:flutter/material.dart';

class Userfields extends StatelessWidget {
  final String hintText;
  final bool secure;
  final TextEditingController controller;

  const Userfields(
      {super.key,
      required this.hintText,
      required this.secure,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: secure,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
