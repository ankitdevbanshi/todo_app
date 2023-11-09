import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {

  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

   DialogBox({required this.controller,super.key,
  required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "save", onPress: onSave),
                SizedBox(width: 8,),
                MyButton(text: "cancel", onPress: onCancel),
              ],)
          ],),
      ),
    );;
  }
}
