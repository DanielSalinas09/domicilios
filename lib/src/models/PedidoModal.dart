

class PedidoModal {

  
  List platos;
  String usuarioId;
  String id;
  int valor;
  String estado;
  String direccionId;
  String fecha;
  int numero;
  PedidoModal({
    this.platos,
    this.usuarioId,
    this.id,
    this.valor,
    this.estado,
    this.direccionId,
    this.fecha,
    this.numero,
  });

  PedidoModal.fromJsonMap(Map<String,dynamic>json){
    platos=json['platos'];
    usuarioId=json['usuario_id'];
    id=json['_id'];
    valor=json['valor'];
    estado=json['estado'];
    direccionId=json['direccion_id'];
    fecha=json['fecha'];
    numero=json['numero'];
  }
  
  
}