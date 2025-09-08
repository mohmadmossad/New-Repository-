
import 'package:flutter/material.dart';
import '../config/app_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول')),
      body: Center(child: ElevatedButton(onPressed: ()=> Navigator.pushReplacementNamed(context, AppRoutes.dashboard), child: const Text('دخول تجريبي'))),
    );
  }
}
