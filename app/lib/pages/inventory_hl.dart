import 'package:flutter/material.dart';
import '../widgets/InventoryRowInput.dart';
import '../widgets/DynamicInventoryList.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  List<InventoryRowInput> inputFields = [];

  void onListSubmmit(List<Items> itemList){
    print("called\n");
    for (int i =0; i < itemList.length; i++) {
      print(itemList[i].name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Test'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Inventory',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Expanded(child: DynamicInventoryList(onSubmit: onListSubmmit)),
          ],
        ),
      ),
    );
  }
}
