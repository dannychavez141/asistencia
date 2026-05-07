import 'package:flutter/material.dart';
// Asegúrate de que estas rutas coincidan con la estructura de tu proyecto
import 'package:app/clases/sesion.dart';
import 'package:app/modelos/Musuario.dart';
import 'package:app/principal.dart';
import 'package:app/clases/cDocente.dart';

// Variables Globales (Manteniendo tu estructura original)
late Musuario usuario;
cDocente metodos = cDocente();
sesion ses = sesion();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inicialización de sesión
  usuario = await ses.verificarInicio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asistencia UNU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Lógica de enrutamiento inicial
      home: usuario.id == "null"
          ? const MyHomePage(title: 'Asistencia Unu 2.0')
          : principal(usuario: usuario),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cUsu = TextEditingController();
  final cPass = TextEditingController();
  String cTipo = "DOCENTE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(),
    );
  }

  Widget cuerpo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/fondounu.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.3), // Capa oscura para resaltar el logo
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              constraints: const BoxConstraints(maxWidth: 400),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Logo o Icono Principal
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFF0D47A1),
                    child: Icon(Icons.school, size: 45, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Asistencia Unu 2.0",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D47A1),
                    ),
                  ),
                  const Text(
                    "Panel de Acceso",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  txtUsuario(),
                  const SizedBox(height: 15),
                  txtPass(),
                  const SizedBox(height: 15),
                  spTipo(),
                  const SizedBox(height: 30),
                  btnIngresar(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget txtUsuario() {
    // Autocompletado de DNI si existe sesión previa fallida
    if (usuario.dniUsu != "null" && cUsu.text.isEmpty) {
      cUsu.text = usuario.dniUsu;
    }
    return TextField(
      controller: cUsu,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Usuario / DNI",
        prefixIcon: const Icon(Icons.person_outline),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  Widget txtPass() {
    return TextField(
      controller: cPass,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Contraseña",
        prefixIcon: const Icon(Icons.lock_outline),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  Widget spTipo() {
    List<String> tipos = ['DOCENTE', 'ADMINISTRADOR'];
    return DropdownButtonFormField<String>(
      value: cTipo,
      decoration: InputDecoration(
        labelText: "Tipo de Usuario",
        prefixIcon: const Icon(Icons.admin_panel_settings_outlined),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      onChanged: (String? newValue) {
        setState(() {
          cTipo = newValue!;
          usuario.dniUsu = "";
        });
      },
      items: tipos.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

  Widget btnIngresar() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0D47A1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
        ),
        onPressed: () => validar(),
        child: const Text(
          "INICIAR SESIÓN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }

  // --- Lógica de negocio intacta ---

  void validar() async {
    String usu = cUsu.text.trim();
    String pass = cPass.text.trim();
    String tipo = cTipo;

    if (usu.isEmpty || pass.isEmpty) {
      alerta("Atención", "Campos Vacíos", "Por favor ingrese su usuario y contraseña.");
    } else {
      // Mostrar indicador de carga (opcional)
      List<Musuario> usuarios = await metodos.getUsuario(usu, pass, tipo);
      if (usuarios.isNotEmpty) {
        usuario = usuarios[0];
        ses.guardarSesion(usuario);
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => principal(usuario: usuario)),
        );
      } else {
        alerta("Error", "Credenciales Incorrectas", "No se encontró el usuario o la contraseña es inválida.");
      }
    }
  }

  void alerta(String titulo, String head, String body) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(head, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.redAccent)),
              const SizedBox(height: 10),
              Text(body),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }
}