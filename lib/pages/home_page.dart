import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import '../utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the box
  final _myBox = Hive.box("myBox");
   ToDoDatabase db = ToDoDatabase();

   @override
  void initState() {
    // If this is the frst time  opening app
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  //Text Controller
  final _controller = TextEditingController();

  //checkbox changed
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //New task
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
        );
      }
    );
  }

  //delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("To Do"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child:  Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
          itemBuilder: (context,index) {
          return ToDoList(
              taskName: db.toDoList[index][0],
              isDone: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
          );
        }
      )
    );
  }
}
