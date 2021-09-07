import 'package:flutter/material.dart';
import 'package:domicilios_delivery/src/page/login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => Login(),

      },
    );
  }
}
