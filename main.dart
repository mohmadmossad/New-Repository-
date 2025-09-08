import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/product_screen.dart';
import 'screens/invoice_screen.dart';

void main() {
  runApp(PerfumeERPApp());
}

class PerfumeERPApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfume ERP',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Cairo',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/products': (context) => ProductScreen(),
        '/invoices': (context) => InvoiceScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
