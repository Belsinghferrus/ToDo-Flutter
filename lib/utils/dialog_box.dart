import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;



    DialogBox({
     super.key,
     required this.controller,
     required this.onCancel,
     required this.onSave,
   });

  @override
  Widget build(BuildContext context) {

    TextEditingController textController = TextEditingController();

    return AlertDialog(
    content: Container(
    height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          //user input
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add New task"
            ),
          ),

          //Button --> Save + Cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyButton(
                  text: "save",
                  onPressed: onSave,
              ),
              MyButton(
                  text: "cancel",
                  onPressed: onCancel,
              ),
            ],
          )
        ],
      ),
    ),
    );
  }
}
