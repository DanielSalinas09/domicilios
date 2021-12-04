import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del nombre
  get numero {
    return _prefs.getString('numero') ?? '';
  }

  set numero(int value) {
    _prefs.setString('numero', value.toString());
  }
  get id {
    return _prefs.getString('id') ?? '';
  }

  set id(String value) {
    _prefs.setString('id', value.toString());
  }

  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }
  get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }
  get apellidos {
    return _prefs.getString('apellidos') ?? '';
  }

  set apellidos(String value) {
    _prefs.setString('apellidos', value);
  }
  get valor {
    return _prefs.getString('valor') ?? '';
  }

  set valor(String value) {
    _prefs.setString('valor', value);
  }
  get direccion {
    return _prefs.getString('direccion') ?? '';
  }

  set direccion(String value) {
    _prefs.setString('direccion', value);
  }
  get pedidoId {
    return _prefs.getString('pedidoId') ?? '';
  }

  set pedidoId(String value) {
    _prefs.setString('pedidoId', value);
  }
}
