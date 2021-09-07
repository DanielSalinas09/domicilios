import 'package:domicilios_delivery/src/page/Home.dart';
import 'package:domicilios_delivery/src/page/login.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => Login(),
        'home': (BuildContext context) => Home(),
      },
    );
  }
}
