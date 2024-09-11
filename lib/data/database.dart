
import 'package:hive_flutter/hive_flutter.dart';


class ToDoDatabase{

  List toDoList = [];

  //refernce the box
  final _myBox = Hive.box("myBox");

  //run this method, if opening for the first time
  void createInitialData(){
    toDoList = [
      ["Wake up early", false],
      ["Do exercise", false],
    ];
  }

  //load the data from database
  void loaddata(){
    toDoList = _myBox.get("TODOLIST");
  }

  //update the database
  void updateDatabase(){
    _myBox.put("TODOLIST", toDoList);
  }
}