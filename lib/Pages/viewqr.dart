import 'dart:ui' as ui;

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:park_qr/Pages/qrview_page.dart';
import 'package:park_qr/models/qrs.dart';
import 'package:park_qr/view_models/changes.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Utils/utils.dart';

class ViewQR extends StatefulWidget {
  const ViewQR({Key? key}) : super(key: key);

  @override
  State<ViewQR> createState() => _ViewQRState();
}

class _ViewQRState extends State<ViewQR> {
  Future<void> method() async {
    await context.read<MyModel>().getdetails();
    setState(() {});
  }

  Future<void> _refresh() async {
    await context.read<MyModel>().getdetails();
    setState(() {});
    return null;
  }

  @override
  void initState() {
    super.initState();
    method();
    setState(() {});
  }

  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    BuiltList<Qrs>? list = context.read<MyModel>().state.qrs;
    return RefreshIndicator(
      onRefresh: () {
        _refresh();
        return Future(() => null);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'View your QRs',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
          ),
          padding: const EdgeInsets.all(16.0),
          itemCount: list!.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QRCodeScreen(
                            qrText: list[index].qrdata ?? "---",
                          )),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.indigoAccent.withOpacity(0.3)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImageView(
                      data: list[index]!.qrdata ?? "hello",
                      version: QrVersions.auto,
                      size: 100.0,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 280),
                    Flexible(
                      child: Text(
                        list[index].bike ?? "---",
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Flexible(
                      child: Text(
                        list[index].bikeno ?? "---",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _saveLocalImage() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      print(result);
      Utils.toast(result.toString());
    }
  }

  _saveNetworkImage() async {
    var response = await Dio().get(
        "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    print(result);
    Utils.toast("$result");
  }

  void _showQRPopup(BuildContext context, Map<String, String> data) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your QR Code'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 300.0,
                height: 300.0,
                child: Image.asset(
                  'assets/qr_code.png',
                  width: 300.0,
                  height: 300.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Bike Model: ${data['bikeModel']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text('Vehicle Number: ${data['vehicleNumber']}'),
            ],
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  _saveLocalImage();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('QR Downloaded Successfully'),
                      duration: Duration(seconds: 1)));
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(15.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey; // Disabled color
                      }
                      return const Color.fromRGBO(
                          53, 85, 235, 1); // Enabled color
                    },
                  ),
                ),
                // onPressed: () async {
                //   try {
                //     // Get the QR code image
                //     final ByteData? byteData = await rootBundle
                //         .load('https://picsum.photos/250?image=9');
                //     if (byteData == null) return;
                //
                //     // Get the local directory path
                //     final directory = await getApplicationSupportDirectory();
                //     final imagePath =
                //         '${directory.path}/qr_code_${DateTime.now().millisecondsSinceEpoch}.png';
                //
                //     // Save the image to the local directory
                //     await File(imagePath)
                //         .writeAsBytes(byteData.buffer.asUint8List());
                //
                //     // Check permission to access the gallery
                //     final PermissionStatus status =
                //         await Permission.photos.request();
                //     if (status.isGranted) {
                //       // Save the image to the gallery
                //       final result =
                //           await ImageGallerySaver.saveFile(imagePath);
                //       print('QR code saved: $result');
                //     } else {
                //       print('Permission denied');
                //     }
                //   } catch (e) {
                //     print('Error saving QR code: $e');
                //   }
                //
                //   Navigator.of(context).pop();
                // },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'Download QR',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
