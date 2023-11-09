

import 'package:hive/hive.dart';

class TodoDatabase{
  var todoList = [];
  final todoBox = Hive.box("todo_box");

  void createInitData(){

    todoList = [
      ["hey get up this is beautiful life baby !", false],
      ["hey get up this is beautiful life baby !", false],
      ["hey get up this is beautiful life baby !", false],
    ];
  }
  void readData(){
     todoList = todoBox.get("TODOLIST");
  }

  void updateData(){
    todoBox.put("TODOLIST", todoList);
  }
}