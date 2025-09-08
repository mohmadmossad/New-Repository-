
import 'package:flutter/material.dart';
import '../services/db_simple.dart';

class CustomersScreen extends StatefulWidget { const CustomersScreen({super.key}); @override State<CustomersScreen> createState() => _CustomersScreenState(); }
class _CustomersScreenState extends State<CustomersScreen> {
  List<Map<String,dynamic>> customers = []; final name=TextEditingController(), phone=TextEditingController(), address=TextEditingController();
  @override void initState(){ super.initState(); _load(); }
  Future<void> _load() async { final db=await DB.db; customers = await db.query('customers', orderBy: 'id DESC'); setState((){}); }
  Future<void> _add() async { if(name.text.trim().isEmpty) return; final db=await DB.db; await db.insert('customers', {'name':name.text,'phone':phone.text,'address':address.text}); name.clear(); phone.clear(); address.clear(); _load(); }
  Future<void> _delete(int id) async { final db=await DB.db; await db.delete('customers', where:'id=?', whereArgs:[id]); _load(); }
  @override Widget build(BuildContext c) { return Scaffold(appBar: AppBar(title: const Text('العملاء')), body: Column(children: [ Padding(padding: const EdgeInsets.all(8), child: Row(children:[ Expanded(child: TextField(controller: name, decoration: const InputDecoration(labelText:'الاسم'))), const SizedBox(width:8), ElevatedButton(onPressed:_add, child: const Text('إضافة')) ])), Expanded(child: ListView.builder(itemCount: customers.length,itemBuilder:(_,i){ final cm=customers[i]; return ListTile(title: Text(cm['name'] ?? ''), subtitle: Text('${cm['phone'] ?? ''}'), trailing: IconButton(icon: const Icon(Icons.delete), onPressed: ()=> _delete(cm['id']))); })) ])); }
}
