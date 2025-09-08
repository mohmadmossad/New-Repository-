import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfume ERP',
      home: Scaffold(
        appBar: AppBar(title: Text('ERP Dashboard')),
        body: Center(child: Text('Welcome to Perfume ERP')),
      ),
    );
  }
}
