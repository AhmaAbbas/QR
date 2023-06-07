import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({Key? key}) : super(key: key);

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  String qrvalue = "";
  String result="";
  Future<void> scanqr()async{
    String resultscan="";
    print(resultscan);
    try{
       resultscan=await FlutterBarcodeScanner.scanBarcode('#ff4db6ac', 'Cancel', true,ScanMode.QR);
       print(resultscan);
    }on PlatformException{
      resultscan="Failed to get platform version.";
      print(resultscan);
    }
    setState(() {
      result=resultscan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        title: const Text(
          "Generate Qr Code",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Spacer(),
            BarcodeWidget(
              data: "Ahmed Abbas",
              barcode: Barcode.qrCode(),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                scanqr();
              },
              child: Text(
                "Scan Qr Code",
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor:  Colors.teal.shade300, shape: StadiumBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: result.length==0 ?null:Container(
                padding: EdgeInsets.only(left: 8,top: 5),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey,)
                ),
                child: Center(
                  child: Text(
                    "result scan : $result",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    maxLines: 3,
                  ),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    ));
  }
}
