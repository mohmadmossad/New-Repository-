
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'config/app_routes.dart';
import 'config/app_theme.dart';
import 'services/db_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نظام المحاسبة والمخزون',
      theme: buildTheme(),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
