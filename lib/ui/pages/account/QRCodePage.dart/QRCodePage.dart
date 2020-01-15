import 'package:barty/model/QRCodeArguments.dart';
import 'package:barty/ui/components/navbars/QRCodeNavbar.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatelessWidget {
  
  static final routeName = '/QRcode';


  @override
  Widget build(BuildContext context) {

    final QRCodeArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: QRCodeNavBar(),
      body: Center(
        child: QrImage(
          data: args.data,
          version: QrVersions.auto,
          size: 320,
          gapless: false,
          embeddedImage: args.imageProvider,
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: Size(80, 80),
          ),
        ),
      ),
    );
  }
}
