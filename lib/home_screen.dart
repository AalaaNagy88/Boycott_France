import 'package:flutter/material.dart';
import 'country_name_screen.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomeScreen extends StatelessWidget {
  String _scanBarcode = '';
  Future<String> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    return barcodeScanRes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Barcode scan')),
        body: Builder(builder: (BuildContext context) {
          return Container(
              alignment: Alignment.center,
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        onPressed: () async {
                          _scanBarcode = await scanBarcodeNormal();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CountryNameScreen(
                                        barcode: _scanBarcode,
                                      )));
                        },
                        child: Text("Start barcode scan")),
                  ]));
        }));
  }
}
