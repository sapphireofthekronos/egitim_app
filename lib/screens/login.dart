import 'package:flutter/material.dart';

class login_page extends StatefulWidget {
  @override
  login_pageState createState() => login_pageState();
}

class login_pageState extends State<login_page> {
  String okulnum;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      /// Klavye geldiğinde yukarı kaymasını önler
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Okul Numarası",
                    labelStyle: TextStyle(color: Colors.green),
                    hintText: "Okul Numarası"),
                validator: (okul_num) {
                  if (okul_num.isEmpty) {
                    return "Okul Numaranızı Giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  okulnum = val;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Şifre",
                    labelStyle: TextStyle(color: Colors.green),
                    hintText: "Şifre"),
                validator: (okul_num) {
                  if (okul_num.isEmpty) {
                    return "Şifrenizi Giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  password = val;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    child: Text("Üye Ol"),
                    onPressed: () {},
                  ),
                  MaterialButton(
                      child: Text("Şifremi Unuttum"), onPressed: () {}),
                ],
              ),
              loginbutton()
            ],
          ),
        ),
      ),
    );
  }

  Widget loginbutton() => RaisedButton(
        child: Text("Giriş Yap"),
        onPressed: () {},
      );
}
