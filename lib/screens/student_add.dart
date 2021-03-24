<<<<<<< HEAD


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ht/model/student.dart';
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/student.dart';
>>>>>>> 758ce8b7051318d76d4e6867794fa6ed8fbba06d

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
<<<<<<< HEAD
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
=======
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
>>>>>>> 758ce8b7051318d76d4e6867794fa6ed8fbba06d
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Ahmet"),
    );
  }
}