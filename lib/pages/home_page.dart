import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/my_button.dart';
import 'package:todo_app/utils/todoTile.dart';

class HomePage extends StatefulWidget {

   const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoDatabase db = TodoDatabase();
  final todoBox = Hive.box("todo_box");
  final _controller = TextEditingController();


  @override
  void initState() {

       if(todoBox.get("TODOLIST")==null){
         db.createInitData();
       }
       else{
         db.readData();
       }
    super.initState();
  }


void tapEdit(int? index){
    showDialog(context: context, builder: (context){
      return DialogBox(controller: _controller, onSave: ()=>onSave(index), onCancel: ()=>Navigator.of(context).pop());
    });
}

void onSave(int? index){
    var elem = [
      _controller.text,
      false
    ];
  setState(() {
    if(index==null){
      db.todoList.add(elem);
    }
    else{
      db.todoList[index][0] = elem[0];
      db.todoList[index][1] = elem[1];
    }

  });
  db.updateData();
  _controller.clear();
Navigator.of(context).pop();
}



void deleteTask(int index){
  setState(() {
  db.todoList.removeAt(index);
    });
  db.updateData();
}

  void createNewTask(){
           showDialog(context: context, builder: (context){
             return DialogBox(controller: _controller,
             onSave: ()=>onSave(null), onCancel: ()=> Navigator.of(context).pop(),);
           });
  }

  void toggle(bool? v,int i){
    setState(() {
      db.todoList[i][1]=v;
    });
db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
      child: Icon(Icons.add),),
      appBar: AppBar(
        elevation: 0,
        title: Text("TO DO"),
      ),
      body: ListView.builder(itemCount: db.todoList.length,itemBuilder: (ctx,index){
        return TodoTile(onTapEdit: ()=>tapEdit(index),deleteTask: (context)=>deleteTask(index),text: db.todoList[index][0], taskCompleted: db.todoList[index][1],
            onChanged: (value){
                 toggle(value,index);
        });
      })
    );
  }
}
