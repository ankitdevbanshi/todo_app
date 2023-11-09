import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {

  Function(BuildContext)? deleteTask;
  final bool taskCompleted;
  final String text;
  VoidCallback onTapEdit;
  final Function(bool?)? onChanged;

   TodoTile({super.key,required this.onTapEdit, required this.text,required this.taskCompleted,
    required this.onChanged,required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteTask,
              icon: Icons.delete,
                backgroundColor: Colors.red.shade400,
              borderRadius: BorderRadius.circular(8),
              )
          ],),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(color: Colors.yellow[500],
          borderRadius: BorderRadius.circular(12)),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(children: [
              Checkbox(value: taskCompleted, onChanged: onChanged ,
                activeColor: Colors.black54 ,),
              Text(text, style: TextStyle(decoration: taskCompleted?TextDecoration.lineThrough:null),),
            ],),
           GestureDetector(
               onTap: onTapEdit,
               child: Icon(Icons.edit))
          ],) ,
        ),
      ),
    );
  }
}
