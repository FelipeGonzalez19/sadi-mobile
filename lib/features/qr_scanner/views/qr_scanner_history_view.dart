import 'package:flutter/material.dart';
import 'package:sadi_mobile/core/constants/app_colors.dart';
import 'package:sadi_mobile/core/constants/app_labels.dart';

class QrScannerHistoryView extends StatelessWidget {
  const QrScannerHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
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
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Listado Historico de Escaneos",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  color: Colors.yellow[100],
                )),
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
