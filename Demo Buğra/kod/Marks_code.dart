import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/student.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MarkScreen());
  }
}

class MarkScreen extends StatelessWidget {
  List students = [
    Student.withId(1, "Matematik", "", 95),
    Student.withId(2, "Türkçe", "", 45),
    Student.withId(3, "Sosyal", "Bilgiler", 39),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("DERS NOTLARI"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(students[index].dersAdi1 + " " +
                      students[index].dersAdi2),
                  subtitle: Text("Sınavdan aldığı not : " +
                      students[index].grade.toString()+"[" + students[index].getStatus+"]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://i2.cnnturk.com/i/cnnturk/75/400x0/5f50a0a35cf3b000e0a8f282.jpg"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                );
              }),
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}