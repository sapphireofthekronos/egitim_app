import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/student.dart';
import 'package:flutter_app/screens/student_add.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List students = [
    Student.withId(1, "Buğra", "Hızal", 95),
    Student.withId(2, "Osman", "Koçak", 49),
    Student.withId(3, "Doğaç", "Özdemir", 39),
  ];

  Student selectedStudent = Student.withId(0, "Hiç", " Kimse", 0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Anasayfa"),
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
                  title: Text(students[index].firstName +
                      " " +
                      students[index].lastName),
                  subtitle: Text("Sınavdan aldığı not : " +
                      students[index].grade.toString() +
                      "[" +
                      students[index].getStatus +
                      "]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://i2.cnnturk.com/i/cnnturk/75/400x0/5f50a0a35cf3b000e0a8f282.jpg"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      this.selectedStudent = students[index];
                    });
                  },
                  onLongPress: () {
                    print("Uzun basıldı");
                  },
                );
              }),
        ),
        Text("seçili öğrenci " +
            selectedStudent.firstName +
            " " +
            selectedStudent.lastName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.greenAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>StudentAdd(students),
                      ));
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Yeni öğrenci")
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.refresh_outlined),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Güncelle")
                  ],
                ),
                onPressed: () {
                  print("Güncelle");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("sil"),
                  ],
                ),
                onPressed: () {
                  print("sil");
                },
              ),
            )
          ],
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
