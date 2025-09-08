
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/customers_screen.dart';
import '../screens/suppliers_screen.dart';
import '../screens/products_screen.dart';
import '../screens/invoices_screen.dart';
import '../screens/payment_vouchers_screen.dart';
import '../screens/chart_of_accounts_screen.dart';
import '../screens/journal_entries_screen.dart';
import '../screens/financial_reports_screen.dart';

class AppRoutes {
  static const login = '/';
  static const dashboard = '/dashboard';
  static const customers = '/customers';
  static const suppliers = '/suppliers';
  static const products = '/products';
  static const invoices = '/invoices';
  static const paymentVouchers = '/payment_vouchers';
  static const coa = '/coa';
  static const journal = '/journal';
  static const reports = '/reports';

  static Map<String, WidgetBuilder> routes = {
    login: (_) => const LoginScreen(),
    dashboard: (_) => const DashboardScreen(),
    customers: (_) => const CustomersScreen(),
    suppliers: (_) => const SuppliersScreen(),
    products: (_) => const ProductsScreen(),
    invoices: (_) => const InvoicesScreen(),
    paymentVouchers: (_) => const PaymentVouchersScreen(),
    coa: (_) => const ChartOfAccountsScreen(),
    journal: (_) => const JournalEntriesScreen(),
    reports: (_) => const FinancialReportsScreen(),
  };
}
