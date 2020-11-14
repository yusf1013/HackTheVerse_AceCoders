import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {

  String qr_result = "Not yet scanned";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scan",
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Result: ",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              qr_result,
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20.0,),

            FlatButton(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Scan QR Code",
              ),
              onPressed: () async {
                try{
                  String scanning = await BarcodeScanner.scan();
                  setState(() {
                    qr_result = scanning;
                  });
                }catch(e){
                  print(BarcodeScanner.CameraAccessDenied);
                  print(BarcodeScanner.UserCanceled);
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: Colors.red,
                  width: 1.5,
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
