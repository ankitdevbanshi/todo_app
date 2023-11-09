import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/pages/home_page.dart';


void main() async{

  await Hive.initFlutter();
  var box = await Hive.openBox("todo_box");
  runApp(ToDO());
}

class ToDO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

       theme: ThemeData(primarySwatch: Colors.yellow),

      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}

