
import 'package:flutter/material.dart';
import '../config/app_routes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override Widget build(BuildContext context) {
    final tiles = [
      ('العملاء', AppRoutes.customers),
      ('الموردون', AppRoutes.suppliers),
      ('المنتجات', AppRoutes.products),
      ('الفواتير', AppRoutes.invoices),
      ('سندات الصرف', AppRoutes.paymentVouchers),
      ('الدليل المحاسبي', AppRoutes.coa),
      ('القيود', AppRoutes.journal),
      ('التقارير', AppRoutes.reports),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('لوحة التحكم')),
      body: GridView.count(crossAxisCount: 2, children: tiles.map((t)=> Card(child: InkWell(onTap: ()=> Navigator.pushNamed(context, t.$2), child: Center(child: Text(t.$1))))).toList()),
    );
  }
}
