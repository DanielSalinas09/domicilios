import 'dart:convert';

import 'package:domicilios_delivery/src/models/loginModals.dart';
import 'package:http/http.dart' as http;

class LoginProvider {
  String _url = 'backend-delivery2.azurewebsites.net';

  final loginModal = new LoginModal();
  
  //enviar numero del domiciliario para devolver el codigo de ingreso
  Future<List> login(int numero) async {
    String endpoint = 'api/auth/domiciliario/login';
    final url = Uri.https(_url, endpoint);
    final response = await http.post(url, body: {"numero": numero.toString()});
    final respDecode = jsonDecode(response.body);

    loginModal.code = respDecode['codigo'];
    print("Codigo: " + loginModal.code.toString());
    if (loginModal.code == null) {
      return [false, respDecode['message']];
    } else {
      return [true, loginModal.code];
    }
  }

  Future<List> loginVerificacion(int numero,String code)async{
    String endpoint='api/auth/domiciliario/verify';
    final url=Uri.https(_url,endpoint);
    final response=await http.post(url,body:{
      "numero":numero.toString(),
      "codigo":code
    });
    Map<String, dynamic> respDecode=jsonDecode(response.body);
    if(respDecode['message']=='verificacion completada'){
      return [true,respDecode['token']];
    }else{
      return [false,respDecode['message']];
    }
    return[];
  }

}
