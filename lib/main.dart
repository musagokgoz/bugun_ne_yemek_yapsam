import 'package:bugunneyemekyapsam/girissayfasi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Bugün ne yemek Yapsam?',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: GirisSayfasi(),
      ),
    );
  }
}
