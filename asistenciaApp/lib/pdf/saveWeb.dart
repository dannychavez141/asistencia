import 'dart:async';
import 'dart:js_interop';
import 'dart:typed_data';

import 'package:web/web.dart' as web;

///To save the pdf file in the device
Future<void> saveAndLaunchFileweb(List<int> bytes, String fileName) async {
  final blob = web.Blob(
    <JSAny>[Uint8List.fromList(bytes).toJS].toJS,
    web.BlobPropertyBag(type: 'application/pdf'),
  );
  final url = web.URL.createObjectURL(blob);
  final anchor = web.HTMLAnchorElement()
    ..href = url
    ..download = fileName;

  web.document.body?.append(anchor);
  anchor
    ..click();
  anchor.remove();
  web.URL.revokeObjectURL(url);
}
