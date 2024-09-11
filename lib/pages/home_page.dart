import 'package:flutter/material.dart';
import 'package:todo_app/utils/dialog_box.dart';
import '../utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //create a list
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false]
  ];

  //checkbox changed
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //New task
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("To Do"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: createNewTask,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
          itemBuilder: (context,index) {
          return ToDoList(
              taskName: toDoList[index][0],
              isDone: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
          );
        }
      )
    );
  }
}
