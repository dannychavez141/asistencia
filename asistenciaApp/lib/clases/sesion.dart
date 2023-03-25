import 'package:app/modelos/Musuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sesion {

  void guardarSesion(Musuario usuario) async {
    SharedPreferences reg = await SharedPreferences.getInstance();
    reg.setString("id", usuario.id);
    reg.setString("dniUsu", usuario.dniUsu);
    reg.setString("nombUsu", usuario.nombUsu);
    reg.setString("apepaUsu", usuario.apepaUsu);
    reg.setString("apemaUsu", usuario.apemaUsu);
    reg.setString("tipoUsu", usuario.tipoUsu);
    print(usuario.toString());
  }

  Future<Musuario> verificarInicio() async {
    SharedPreferences reg = await SharedPreferences.getInstance();
    String id = reg.getString("id").toString();
    String dni = reg.getString("dniUsu").toString();
    String nomb = reg.getString("nombUsu").toString();
    String apepa = reg.getString("apepaUsu").toString();
    String apema = reg.getString("apemaUsu").toString();
    String tipo = reg.getString("tipoUsu").toString();
    Musuario usuario = new Musuario(id, dni, nomb, apepa,apema,tipo);
   // print(usuario.toString());
    return usuario;
  }
void cerrarSesion() async{
  SharedPreferences reg = await SharedPreferences.getInstance();
  reg.remove("id");
  reg.remove("dniUsu");
  reg.remove("nombUsu");
  reg.remove("apepaUsu");
  reg.remove("apemaUsu");
  reg.remove("tipoUsu");
}
  sesion();
}
