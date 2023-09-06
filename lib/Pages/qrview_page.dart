import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatelessWidget {
  final String qrText;

  QRCodeScreen({required this.qrText});

  @override
  Widget build(BuildContext context) {
    // Generate the QR code as a Uint8List
    final qrCode = QrImageView(
      data: qrText,
      version: QrVersions.auto,
      size: 200.0,
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "QR Code",
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            qrCode,
            SizedBox(height: 20),
            Text('Your QR Code'),
          ],
        ),
      ),
    );
  }
}
