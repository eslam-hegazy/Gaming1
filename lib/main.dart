import 'package:flutter/material.dart';
import 'package:games/screen1.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "myApp",
      debugShowCheckedModeBanner: false,
      home: myhome(),
    );
  }
}

class myhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return screen1();
  }
}
