import 'package:flutter/material.dart';
import 'package:sadi_mobile/features/qr_scanner/views/qr_scanner_history_view.dart';
import 'package:sadi_mobile/features/qr_scanner/views/result_scanner_view.dart';
import '../features/login/views/login_view.dart';
import '../features/qr_scanner/views/qr_scanner_view.dart';

class AppRoutes {
  // Def routes
  static const String login = '/login';
  static const String qrScanner = '/qr-scanner';
  static const String resultScanner = '/result-scanner';
  static const String historicScanner = '/historic-scanner';

  // Map connecting routes with widgets
  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginView(),
    qrScanner: (context) => const QrScannerView(),
    resultScanner: (context) => const ResultScannerView(),
    historicScanner: (context) => const QrScannerHistoryView()
  };
}
