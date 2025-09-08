
import 'package:flutter/material.dart';
import '../services/db_simple.dart';

class InvoicesScreen extends StatefulWidget { const InvoicesScreen({super.key}); @override State<InvoicesScreen> createState() => _InvoicesScreenState(); }
class _InvoicesScreenState extends State<InvoicesScreen> {
  List<Map<String,dynamic>> invoices = []; final date=TextEditingController(), total=TextEditingController();
  @override void initState(){ super.initState(); _load(); }
  Future<void> _load() async { final db=await DB.db; invoices=await db.query('invoices', orderBy:'id DESC'); setState((){}); }
  Future<void> _add() async { final db=await DB.db; await db.insert('invoices', {'type':'sale','date':date.text,'total_amount':double.tryParse(total.text)??0}); date.clear(); total.clear(); _load(); }
  Future<void> _delete(int id) async { final db=await DB.db; await db.delete('invoices', where:'id=?', whereArgs:[id]); _load(); }
  @override Widget build(BuildContext c){ return Scaffold(appBar: AppBar(title: const Text('الفواتير')), body: Column(children:[ Padding(padding: const EdgeInsets.all(8), child: Row(children:[ Expanded(child: TextField(controller: date, decoration: const InputDecoration(labelText:'التاريخ'))), const SizedBox(width:8), ElevatedButton(onPressed:_add, child: const Text('إضافة')) ])), Expanded(child: ListView.builder(itemCount:invoices.length,itemBuilder:(_,i){ final inv=invoices[i]; return ListTile(title: Text('${inv['type'] ?? ''} - ${inv['date'] ?? ''}'), subtitle: Text('الإجمالي: ${inv['total_amount'] ?? 0}'), trailing: IconButton(icon: const Icon(Icons.delete), onPressed: ()=> _delete(inv['id']))); })) ])); }
}
