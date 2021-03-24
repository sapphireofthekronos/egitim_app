import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/student.dart';

// ignore: must_be_immutable
class StudentAdd extends StatefulWidget{

  List<Student> students;
  StudentAdd(List<Student> students){
    this.students = students;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }

}

class _StudentAddState extends State{
  Student student = Student("", "", 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni öğrenci"),),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: <Widget>[
              buildFirstNameField()
            ],
          ),
        ),
      )
    );
  }

 Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Ahmet"),
    );
  }
}