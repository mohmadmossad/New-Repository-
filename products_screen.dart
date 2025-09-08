
import 'package:flutter/material.dart';
import '../services/db_simple.dart';

class ProductsScreen extends StatefulWidget { const ProductsScreen({super.key}); @override State<ProductsScreen> createState() => _ProductsScreenState(); }
class _ProductsScreenState extends State<ProductsScreen> {
  List<Map<String,dynamic>> products = []; final name=TextEditingController(), price=TextEditingController(), qty=TextEditingController();
  @override void initState(){ super.initState(); _load(); }
  Future<void> _load() async { final db=await DB.db; products=await db.query('products', orderBy:'id DESC'); setState((){}); }
  Future<void> _add() async { if(name.text.trim().isEmpty) return; final db=await DB.db; await db.insert('products', {'name':name.text,'price':double.tryParse(price.text)??0,'quantity':int.tryParse(qty.text)??0}); name.clear(); price.clear(); qty.clear(); _load(); }
  Future<void> _delete(int id) async { final db=await DB.db; await db.delete('products', where:'id=?', whereArgs:[id]); _load(); }
  @override Widget build(BuildContext c){ return Scaffold(appBar: AppBar(title: const Text('المنتجات')), body: Column(children:[ Padding(padding: const EdgeInsets.all(8), child: Row(children:[ Expanded(child: TextField(controller: name, decoration: const InputDecoration(labelText:'الاسم'))), const SizedBox(width:8), ElevatedButton(onPressed:_add, child: const Text('إضافة')) ])), Expanded(child: ListView.builder(itemCount:products.length,itemBuilder:(_,i){ final p=products[i]; return ListTile(title: Text(p['name']??''), subtitle: Text('سعر: ${p['price'] ?? 0} | كمية: ${p['quantity'] ?? 0}'), trailing: IconButton(icon: const Icon(Icons.delete), onPressed: ()=> _delete(p['id']))); })) ])); }
}
