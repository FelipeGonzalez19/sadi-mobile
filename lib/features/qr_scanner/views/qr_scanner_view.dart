import 'package:flutter/material.dart';
import 'package:sadi_mobile/core/constants/app_colors.dart';
import 'package:sadi_mobile/core/constants/app_labels.dart';
import 'package:sadi_mobile/routes/app_routes.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerView extends StatefulWidget with WidgetsBindingObserver {
  const QrScannerView({super.key});

  @override
  State<QrScannerView> createState() => _QrScannerViewState();
}

class _QrScannerViewState extends State<QrScannerView> {
  bool _isScanning = false;

  void _handleBarcode(BarcodeCapture barcodes) {
    if (_isScanning) return;
    if (barcodes.barcodes.isNotEmpty) {
      final barcode = barcodes.barcodes.firstOrNull?.rawValue;
      if (barcode != null && mounted) {
        setState(() {
          _isScanning = true;
        });
        Navigator.pushNamed(
          context,
          AppRoutes.resultScanner,
          arguments: barcode,
        ).then((_) {
          setState(() {
            _isScanning = false;
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.historicScanner);
            },
            icon: const Icon(Icons.info),
          ),
          // Se va a remover
          // IconButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, AppRoutes.resultScanner);
          //   },
          //   icon: const Icon(Icons.home),
          // )
        ],
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        title: Text(
          AppLabels.appBar,
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.042),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.secondaryColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Coloque el código QR en el lector",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: MediaQuery.of(context).size.width * 0.038,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("El scanner se activará automáticamente",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: MediaQuery.of(context).size.width * 0.034,
                      )),
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: Visibility(
                    visible: !_isScanning,
                    child: MobileScanner(
                      onDetect: _handleBarcode,
                    ))),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: const Text("developed by KLSoftware",
                  style: TextStyle(color: Colors.black54)),
            )),
          ],
        ),
      ),
    );
  }
}
