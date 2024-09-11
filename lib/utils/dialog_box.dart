import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    content: Container(
    height: 120,
      child: Column(
        children: [

          //user input
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add New task"
            ),
          ),

          //Button --> Save + Cancel
          Row(
            children: [
              ElevatedButton(onPressed: (){}, child: Text("Save")),
              Padding(padding: EdgeInsets.all(20)),
              ElevatedButton(onPressed: (){}, child: Text("Cancel")),
            ],
          )
        ],
      ),
    ),
    );
  }
}
