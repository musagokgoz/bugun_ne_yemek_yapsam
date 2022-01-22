import 'dart:io';

import 'package:bugunneyemekyapsam/yemeksayfasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  final _formAnahtari = GlobalKey<FormState>();
  String isim;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formAnahtari,
          child: ListView(
            padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
            children: <Widget>[
              CircleAvatar(
                  radius: 90,
                  child: Lottie.asset(
                    'assets/lottie/food.json',
                  )),
              SizedBox(height: 30.0),
              TextFormField(
                //scrollPadding: EdgeInsets.zero,
                autocorrect: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  labelText: "İsminizi Giriniz",
                  errorStyle: TextStyle(fontSize: 16.0),
                  prefixIcon: Icon(
                    Icons.account_circle_sharp,
                    size: 35,
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (girilenDeger) {
                  if (girilenDeger.isEmpty) {
                    return "İsim alanı boş bırakılamaz!";
                  }
                  return null;
                },
                onSaved: (girilenDeger) {
                  isim = girilenDeger;
                },
              ),
              SizedBox(height: 20.0),
              InkWell(
                onTap: () {
                  if (_formAnahtari.currentState.validate()) {
                    _formAnahtari.currentState.save();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => YemekSayfasi(
                              isim: isim,
                            )));
                    _formAnahtari.currentState.reset();
                  }
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  exit(0);
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Çıkış Yap",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
