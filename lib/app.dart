import 'package:domicilios_delivery/preferencias_usuario/preferencias.dart';
import 'package:domicilios_delivery/src/page/Home.dart';
import 'package:domicilios_delivery/src/page/login.dart';
import 'package:domicilios_delivery/src/page/loginVerificacion.dart';
import 'package:domicilios_delivery/src/providers/infoProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'src/utils/DireccionProvider.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _prefs= new PreferenciasUsuario();
  String navegacion;
  @override
  Widget build(BuildContext context) {
    if(_prefs.token!=""){
      navegacion="home";
    }else{
      navegacion='login';
    }
    return 
      MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => InfoProvider(),
        ),
        ChangeNotifierProvider(
      create: (_)=>DireccionProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        initialRoute: navegacion,
        routes: {
          'login':              (BuildContext context) => Login(),
          'loginVerificacion':  (BuildContext context) => LoginVerificacion(),
          'home':               (BuildContext context) => Home(),

        },
      ),
    );
  }
}
