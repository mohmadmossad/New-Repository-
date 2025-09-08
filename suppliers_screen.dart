
import 'package:flutter/material.dart';
import '../services/db_simple.dart';

class SuppliersScreen extends StatefulWidget { const SuppliersScreen({super.key}); @override State<SuppliersScreen> createState() => _SuppliersScreenState(); }
class _SuppliersScreenState extends State<SuppliersScreen> {
  List<Map<String,dynamic>> suppliers = []; final name=TextEditingController(), phone=TextEditingController(), address=TextEditingController(), score=TextEditingController();
  @override void initState(){ super.initState(); _load(); }
  Future<void> _load() async { final db=await DB.db; suppliers=await db.query('suppliers', orderBy:'id DESC'); setState((){}); }
  Future<void> _add() async { if(name.text.trim().isEmpty) return; final db=await DB.db; await db.insert('suppliers', {'name':name.text,'phone':phone.text,'address':address.text,'performance_score':int.tryParse(score.text)??0}); name.clear(); phone.clear(); address.clear(); score.clear(); _load(); }
  Future<void> _delete(int id) async { final db=await DB.db; await db.delete('suppliers', where:'id=?', whereArgs:[id]); _load(); }
  @override Widget build(BuildContext c){ return Scaffold(appBar: AppBar(title: const Text('الموردون')), body: Column(children:[ Padding(padding: const EdgeInsets.all(8), child: Row(children:[ Expanded(child: TextField(controller: name, decoration: const InputDecoration(labelText:'الاسم'))), const SizedBox(width:8), ElevatedButton(onPressed:_add, child: const Text('إضافة')) ])), Expanded(child: ListView.builder(itemCount:suppliers.length,itemBuilder:(_,i){ final s=suppliers[i]; return ListTile(title: Text(s['name']??''), subtitle: Text('تقييم: ${s['performance_score'] ?? 0}'), trailing: IconButton(icon: const Icon(Icons.delete), onPressed: ()=> _delete(s['id']))); })) ])); }
}
