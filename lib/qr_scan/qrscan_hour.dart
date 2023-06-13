import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cspace/servise/client_work_time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:cspace/servise/client.dart';

class QRSanHour extends StatefulWidget {
  String currentTime = DateFormat('hh:mm:ss a').format(DateTime.now());
  String currentDay = DateFormat('dd-MM-yyyy').format(DateTime.now());
  QRSanHour({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRSanHourState();
}

class _QRSanHourState extends State<QRSanHour> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isIconOne = true;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text('Data: ${result!.code}')
                  else
                    const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: () async {
                            await controller?.toggleFlash();
                            setState(() {
                              isIconOne = !isIconOne;
                            });
                          },
                          icon: isIconOne == true
                              ? const Icon(Icons.flashlight_on)
                              : const Icon(Icons.flashlight_off),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            Client client = Client(name: result!.code.toString(), date: widget.currentDay, checkInTime: widget.currentTime, checkOutTime: widget.currentTime);
                            client.addChekInChekOutTime(client);
                            Navigator.pop(context, (result!.code).toString());
                            ClientWorkTime clientWorkTime = ClientWorkTime(clientName: result!.code.toString());
                            clientWorkTime.convert();
                          },
                          child: const Text('Check',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Text(widget.currentTime),
          Text(widget.currentDay),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}