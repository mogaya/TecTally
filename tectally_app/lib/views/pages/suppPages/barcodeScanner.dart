import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customText.dart';

class Barcodescanner extends StatefulWidget {
  const Barcodescanner({super.key});

  @override
  State<Barcodescanner> createState() => _BarcodescannerState();
}

class _BarcodescannerState extends State<Barcodescanner> {
  String barcode = "";

  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(
        () {
          barcode = result.rawContent;
        },
      );
    } catch (e) {
      setState(
        () {
          barcode = 'Failed to get barcode';
        },
      );
    }
  }

  Future<void> copyToClipboard() async {
    if (barcode.isNotEmpty) {
      await Clipboard.setData(ClipboardData(text: barcode));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const customText(
            label: "Barcode copied to clipboard",
            labelColor: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const customText(
          label: 'Barcode Scanner',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const customText(
              label: 'Scanned Barcode:',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            customText(
              label: barcode,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              labelColor: secondaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: scanBarcode,
              child: const customText(
                label: 'Scan Barcode',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: copyToClipboard,
              child: const customText(
                label: 'Copy Barcode',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
