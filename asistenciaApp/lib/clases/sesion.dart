import 'package:app/modelos/Musuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sesion {

  void guardarSesion(Musuario usuario) async {
    SharedPreferences reg = await SharedPreferences.getInstance();
    reg.setString("id", usuario.id);
    reg.setString("dni", usuario.dni);
    reg.setString("datos", usuario.datos);
    reg.setString("tipo", usuario.tipo);
   // print(usuario.toString());
  }

  Future<Musuario> verificarInicio() async {
    SharedPreferences reg = await SharedPreferences.getInstance();
    String id = reg.getString("id").toString();
    String dni = reg.getString("dni").toString();
    String datos = reg.getString("datos").toString();
    String tipo = reg.getString("tipo").toString();
    Musuario usuario = new Musuario(id, dni, datos, tipo);
   // print(usuario.toString());
    return usuario;
  }
void cerrarSesion() async{
  SharedPreferences reg = await SharedPreferences.getInstance();
  reg.remove("id");
  reg.remove("dni");
  reg.remove("datos");
  reg.remove("tipo");
}
  sesion();
}
