import 'package:flutter/material.dart';
import 'package:sadi_mobile/core/constants/app_colors.dart';
import 'package:sadi_mobile/core/constants/app_labels.dart';

class ResultScannerView extends StatelessWidget {
  const ResultScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    final qrCode = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
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
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Resultado del escaneo",
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
                  alignment: Alignment.center,
                  color: Colors.green[100],
                  child: qrCode != null
                      ? Text(
                          qrCode,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        )
                      : const Text(
                          'No se ha escaneado ningún código',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                )),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Volver',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    )),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
