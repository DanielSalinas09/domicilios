import 'package:domicilios_delivery/src/page/Home.dart';
import 'package:domicilios_delivery/src/page/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/utils/DireccionProvider.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>DireccionProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => Login(),
          'home': (BuildContext context) => Home(),
        },
      ),
    );
  }
}
