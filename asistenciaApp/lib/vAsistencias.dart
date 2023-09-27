import 'dart:async';
import 'dart:convert';
import 'package:app/clases/sesion.dart';
import 'package:app/modelos/mAsistencia.dart';
import 'package:app/modelos/mLogo.dart';
import 'package:app/pdf/saveApp.dart';
//import 'package:app/pdf/saveWeb.dart';
import 'package:flutter/material.dart';
import 'package:app/modelos/mDocente.dart';
import 'package:app/clases/vistas.dart';
import 'package:flutter/services.dart';
import 'dart:io' ;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'clases/cAsistencia.dart';
import 'modDocente.dart';
import 'modelos/Musuario.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
Future<Directory?>? _appSupportDirectory;
class vAsistencias extends StatefulWidget {
  final Musuario usuario;

  const vAsistencias({super.key, required this.usuario});

  @override
  State<vAsistencias> createState() => _vAsistenciasState();
}

class _vAsistenciasState extends State<vAsistencias> {
  TextEditingController cBusq = TextEditingController();
  late List<mAsistencia> asist;
  late Future<List<mAsistencia>> ldocentes;
  cAsistencia metodos = new cAsistencia();
  sesion ses = sesion();
  mLogo mlog= mLogo();
 String tempFoto ="";
  late Vistas componentes;

  @override
  void initState() {
    cBusq = TextEditingController();
    super.initState();
    var now = new DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    //print(formattedDate);
     tempFoto =mlog.logo;
    cBusq.text = formattedDate;
    ldocentes = metodos.getAsistencias(cBusq.text);
  }

  @override
  Widget build(BuildContext context) {
    componentes = new Vistas("ASISTENCIAS", context, widget.usuario);
    return Scaffold(
        drawer: componentes.menu(widget.usuario.tipoUsu),
        appBar: AppBar(title: Text(componentes.titulopage)),
        body: Center(
          child: Column(
            children: <Widget>[pantalla(context)],
          ),
        ));
  }

  Widget pantalla(context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(6),
          child: const Text(
            "ASISTENCIAS REGISTRADAS",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: txtBusq()),
              Container(
                  margin: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: btnBuscar()),
              Container(
                  margin: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: this.componentes.btn(0, 200, 100, "GENERAR PDF",
                      pAccion: () => {generarReporte()}))
            ]),
        Center(
            child: Container(
          margin: const EdgeInsets.all(10),
          child: const Text("Lista de Asistencia:"),
        )),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.66,
            child: listaDatos(context)),
      ],
    );
  }

  Widget txtBusq() {
    return GestureDetector(
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 100),
                lastDate: DateTime(DateTime.now().year + 1))
            .then((value) {
          String mes = value!.month.toString();
          if (int.parse(mes) <= 10) {
            mes = "0" + mes;
          }
          String dia = value!.day.toString();
          if (int.parse(dia) <= 10) {
            dia = "0" + dia;
          }
          cBusq.text = '${value?.year.toString()}-${mes}-${dia}';
        });
      },
      child: TextField(
        controller: this.cBusq,
        enabled: false,
      ),
    );
  }

  Widget btnBuscar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () => setState(() {
                    ldocentes = metodos.getAsistencias(cBusq.text);
                  }),
              child: const Text("Buscar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget listaDatos(context) {
    return FutureBuilder(
        future: ldocentes,
        builder: (context, snapshop) {
          if (snapshop.hasData) {
            // print(snapshop.data);
            List<mAsistencia>? datos = snapshop.data;
            asist = datos!;
            if (datos!.length > 0) {
              return ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: elementos(datos),
              );
            } else {
              return Text("NO EXISTEN REGISTROS");
            }
          } else if (snapshop.hasError) {
            print(snapshop.error);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  List<Widget> elementos(List<mAsistencia>? data) {
    List<Widget> element = [];
    int i = 0;
    for (var ele in data!) {
      i++;
      /*if (ele.docente.foto.length < 5) {
        ele.docente.foto = tempFoto;
      }
      Uint8List img;
      img = Base64Decoder().convert(ele.docente.foto);*/

      // print(i.toString() + ele.toString());
      element.add(Card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              margin: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.20,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // print("por que me tocas papi"+ele.dni);
                      //detallerAlu(ele.docente);
                    });
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(ele.docente.dniDoc),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(3),
                      )
                    ],
                  ))),
          Container(
              margin: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.30,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.docente.nomDoc),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.docente.apepaDoc+" "+ele.docente.apemaDoc),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(3),
                  )
                ],
              )),
          Container(
              margin: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.35,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text("FECHA: " + ele.fecha),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text("ENTRADA: " + ele.entrada),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text("SALIDA: " + ele.salida),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(3),
                  )
                ],
              ))
        ],
      )));
    }
    return element;
  }

  Widget btnCerrarDet() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(76, 0, 240, 1.0),
                    Color.fromRGBO(76, 0, 240, 1.0),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                // Navigator.push(
                //      context, MaterialPageRoute(builder: (context) => pdfAlu()));
              },
              child: const Text("Ver Horario",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }


  void saltoMod(mDocente doc) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                modDocente(usuario: widget.usuario, mdoc: doc)));
  }

  Future<void> generarReporte() async {
    if (asist.length == 0) {
      Fluttertoast.showToast(
          msg: "No se puede generar el reporte por que no existen datos",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    //Create a PDF document.
    final PdfDocument document = PdfDocument();
    //Add page to the PDF
    final PdfPage page = document.pages.add();
    //Get page client size
    final Size pageSize = page.getClientSize();
    //Draw rectangle
    page.graphics.drawRectangle(
        bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
        pen: PdfPen(PdfColor(142, 170, 219)));
    //Generate PDF grid.
    final PdfGrid grid = getGrid(asist);
    //Draw the header section by creating text element
    final PdfLayoutResult result = drawHeader(page, pageSize, grid);
    //Draw grid
    drawGrid(page, grid, result);
    //Add invoice footer
    //drawFooter(page, pageSize);
    //logo sistemas
    Uint8List img;
    img = Base64Decoder().convert(tempFoto);
    page.graphics.drawImage(
        PdfBitmap(img),
        Rect.fromLTWH(
            450, 5, 50, 50));
    //Save the PDF document

    final List<int> bytes = document.saveSync();
    //Dispose the document.
    document.dispose();
    //Save and launch the file.
    if (kIsWeb) {
    //  await saveAndLaunchFileweb(bytes, 'reporteAsistencia.pdf');
    } else {

      await saveAndLaunchFile(bytes, 'reporteAsistencia.pdf');
    }
  }
  void _requestAppSupportDirectory() {
    setState(() {
      _appSupportDirectory = path_provider.getApplicationSupportDirectory();
    });
  }
  //Draws the invoice header
  PdfLayoutResult drawHeader(PdfPage page, Size pageSize, PdfGrid grid) {
    //Draw rectangle
    page.graphics.drawRectangle(
        brush: PdfSolidBrush(PdfColor(91, 126, 215)),
        bounds: Rect.fromLTWH(0, 0, pageSize.width, 60));
    //Draw string
    page.graphics.drawString('Reporte de Asistencias de ' + cBusq.text,
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        brush: PdfBrushes.white,
        bounds: Rect.fromLTWH(25, 0, pageSize.width - 115, 60),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    //Create data foramt and convert it to text.
    final DateFormat format = DateFormat('d/M/y');
    final String invoiceNumber =
        'Reporte Generado: ${format.format(DateTime.now())}';
    final Size contentSize = contentFont.measureString(invoiceNumber);
    // ignore: leading_newlines_in_multiline_strings
    String generado = 'Usuario:\n' +
        widget.usuario.nombUsu +
        ' ' +
        widget.usuario.apepaUsu +
        ' ' +
        widget.usuario.apemaUsu +
        "\nTipo Usuario:\n" +
        widget.usuario.tipoUsu;
    PdfTextElement(text: invoiceNumber, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 70,
            contentSize.width, pageSize.height));
    return PdfTextElement(text: generado, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(50, 70, pageSize.width - (contentSize.width),
            pageSize.height - 30))!;
  }

  //Draws the grid
  void drawGrid(PdfPage page, PdfGrid grid, PdfLayoutResult result) {
    Rect? totalPriceCellBounds;
    Rect? quantityCellBounds;
    //Invoke the beginCellLayout event.
    grid.beginCellLayout = (Object sender, PdfGridBeginCellLayoutArgs args) {
      final PdfGrid grid = sender as PdfGrid;
      if (args.cellIndex == grid.columns.count - 1) {
        totalPriceCellBounds = args.bounds;
      } else if (args.cellIndex == grid.columns.count - 2) {
        quantityCellBounds = args.bounds;
      }
    };
    //Draw the PDF grid and get the result.
    result = grid.draw(
        page: page, bounds: Rect.fromLTWH(0, result.bounds.bottom + 20, 0, 0))!;
  }

  //Draw the invoice footer data.
  void drawFooter(PdfPage page, Size pageSize) {
    final PdfPen linePen =
        PdfPen(PdfColor(142, 170, 219), dashStyle: PdfDashStyle.custom);
    linePen.dashPattern = <double>[3, 3];
    //Draw line
    page.graphics.drawLine(linePen, Offset(0, pageSize.height - 100),
        Offset(pageSize.width, pageSize.height - 100));

    String footerContent = 'Reporte generado por:\n' + widget.usuario.nombUsu;

    //Added 30 as a margin for the layout
    page.graphics.drawString(
        footerContent, PdfStandardFont(PdfFontFamily.helvetica, 9),
        format: PdfStringFormat(alignment: PdfTextAlignment.right),
        bounds: Rect.fromLTWH(pageSize.width - 30, pageSize.height - 70, 0, 0));
  }

  //Create PDF grid and return
  PdfGrid getGrid(datos) {
    //Create a PDF grid
    final PdfGrid grid = PdfGrid();
    //Secify the columns count to the grid.
    grid.columns.add(count: 5);
    //Create the header row of the grid.
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    //Set style
    headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
    headerRow.style.textBrush = PdfBrushes.white;
    headerRow.cells[0].value = "DNI";
    headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[1].value = 'NOMBRES Y APELLIDOS';
    headerRow.cells[2].value = 'FECHA';
    headerRow.cells[3].value = 'HORA DE ENTRADA';
    headerRow.cells[4].value = 'HORA DE SALIDA';
    //Add rows

    for (var i = 0; i < datos.length; i++) {
      mAsistencia asist = datos[i];
      print(asist.toString());
      addAsistencia(
          asist.docente.dniDoc,
          asist.docente.nomDoc +
              " " +
              asist.docente.apepaDoc +
              " " +
              asist.docente.apemaDoc,
          asist.fecha,
          asist.entrada,
          asist.salida,
          grid);
    }
    //Apply the table built-in style
    grid.applyBuiltInStyle(PdfGridBuiltInStyle.gridTable1Light);
    //Set gird columns width
    grid.columns[1].width = 200;
    for (int i = 0; i < headerRow.cells.count; i++) {
      headerRow.cells[i].style.cellPadding =
          PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
    }
    for (int i = 0; i < grid.rows.count; i++) {
      final PdfGridRow row = grid.rows[i];
      for (int j = 0; j < row.cells.count; j++) {
        final PdfGridCell cell = row.cells[j];
        if (j == 0) {
          cell.stringFormat.alignment = PdfTextAlignment.center;
        }
        cell.style.cellPadding =
            PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
      }
    }
    return grid;
  }

  //Create and row for the grid.
  void addAsistencia(String id, String docente, String fecha, String entrada,
      String salida, PdfGrid grid) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = id;
    row.cells[1].value = docente;
    row.cells[2].value = fecha;
    row.cells[3].value = entrada;
    row.cells[4].value = salida;
  }
}
