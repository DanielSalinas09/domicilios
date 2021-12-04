import 'dart:convert';



import 'package:http/http.dart' as http;

class PedidoProvider {
  String _url = 'backend-delivery2.azurewebsites.net';

  Future<List> pedidoAsignado(String id, String token) async {
    final url = Uri.https(_url, 'api/domiciliario/get/pedido/' + id);
    final resp = await http.get(url, headers: {'x-access-token': token});
    final respDecode = jsonDecode(resp.body);
    print('==================');
    print(respDecode);
    if (respDecode['pedido']['domiciliario_id']['_id'] == id) {
      int valor = respDecode['pedido']['valor'];
      String direccion = respDecode['pedido']['direccion_id']['direccion'];
      String nombre = respDecode['pedido']['usuario_id']['nombre'];
      String apellidos = respDecode['pedido']['usuario_id']['apellidos'];
      String pedidoId = respDecode['pedido']['_id'];
      return [true,nombre, apellidos, direccion, valor, pedidoId];
    }else{
      return [false,respDecode['message']];
    }
    
  }

  Future<String> pedidoFinalizado(String pedidoId, String domiciliarioId, String token) async {
    final url = Uri.https(_url, 'api/pedido/finalizar/' + pedidoId);
    final resp = await http.put(url, headers: {'x-access-token': token});
    final respDecode = jsonDecode(resp.body);
    return respDecode['message'];
  }
}
