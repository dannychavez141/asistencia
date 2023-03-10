import 'dart:async';
import 'dart:isolate';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Conexion.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
Future<void> initNoti() async{
  const AndroidInitializationSettings initializationSettings= AndroidInitializationSettings('not_icon');
  const DarwinInitializationSettings initializationSettingsIos= DarwinInitializationSettings();
  const InitializationSettings initializationSettingsAll= InitializationSettings(
      android: initializationSettings,
      iOS: initializationSettingsIos
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettingsAll);
 // hilo();
}
Future<void> MostrarNoti(String titulo,String mensaje) async{
  AndroidNotificationDetails  androidNotificationDetails=  AndroidNotificationDetails('your_channel_id', 'your_channel_name',importance: Importance.max,priority: Priority.high);
  DarwinNotificationDetails darwinNotificationDetails=DarwinNotificationDetails();
  NotificationDetails notificationDetails= NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails
  );
  await flutterLocalNotificationsPlugin.show(1, titulo , mensaje, notificationDetails);
}
void hilo() async {
  //await initNoti();
  ReceivePort receivePort = ReceivePort();
  Isolate isolate = await Isolate.spawn(getHisto, receivePort.sendPort);
  receivePort.listen((data) {
   // print("RESPUESTA 2:"+data);
    final datosjson = jsonDecode(data);

    for (var item in datosjson) {
      MostrarNoti(item["descr"], item["fecha"] + " / " + item["hora"]);
    }
  });
  // print(msj);
}

void getHisto(SendPort sendPort) async {
  Timer.periodic(new Duration(seconds: 5), (Timer t) async {
  //  await initNoti();
    Conexion conexion = new Conexion();
    String api = conexion.url + "appmovil/notificaciones.php?cod=00086749";
    var uri = Uri.parse(api);
    final resp = await http.get(uri);

    if (resp.statusCode == 200) {
      //  print(resp.body);
      String body = resp.body;
      sendPort.send(body);
      // print("respuesta 1:"+body);

      } else {
        throw Exception("Error de api");
      }

  });
}
