
import 'package:flutter/material.dart';
import '../services/db_simple.dart';

class FinancialReportsScreen extends StatefulWidget { const FinancialReportsScreen({super.key}); @override State<FinancialReportsScreen> createState() => _FinancialReportsScreenState(); }
class _FinancialReportsScreenState extends State<FinancialReportsScreen> {
  List<Map<String,dynamic>> trial=[]; double totalD=0, totalC=0;
  @override void initState(){ super.initState(); _load(); }
  Future<void> _load() async {
    final db=await DB.db;
    final rows = await db.rawQuery('''
      SELECT a.id, a.code, a.name, a.type, IFNULL(SUM(jl.debit),0) as debit, IFNULL(SUM(jl.credit),0) as credit, a.opening_balance as opening
      FROM chart_of_accounts a LEFT JOIN journal_lines jl ON a.id = jl.account_id
      GROUP BY a.id ORDER BY a.code ASC
    ''');
    totalD = 0; totalC = 0;
    trial = rows.map((r){
      final d = (r['debit'] as num).toDouble() + ((r['opening'] as num?)?.toDouble() ?? 0);
      final c = (r['credit'] as num).toDouble();
      totalD += d; totalC += c;
      return {...r, 'debit_total': d, 'credit_total': c};
    }).toList();
    setState((){});
  }
  @override Widget build(BuildContext c){ return Scaffold(appBar: AppBar(title: const Text('التقارير المالية')), body: Padding(padding: const EdgeInsets.all(8), child: Column(children:[ Expanded(child: ListView.builder(itemCount: trial.length,itemBuilder: (_,i){ final r=trial[i]; return ListTile(title: Text('${r['code']} - ${r['name']}'), subtitle: Text('مدين: ${r['debit_total']} | دائن: ${r['credit_total']}')); })), const Divider(), ListTile(title: const Text('الإجمالي'), subtitle: Text('مدين: \$${totalD.toStringAsFixed(2)} | دائن: \$${totalC.toStringAsFixed(2)}')) ]))); }
}
