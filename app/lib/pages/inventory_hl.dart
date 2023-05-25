import 'package:flutter/material.dart';
import '../widgets/InventoryRowInput.dart';
import '../widgets/DynamicInventoryList.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}


class Items {
  String name = "";
  int amount = 0;

  void changeName(String newName) {
    name = newName;
  }

  void changeAmount(int newAmount) {
    amount = newAmount;
  }
}

class _InventoryPageState extends State<InventoryPage> {
  List<InventoryRowInput> inputFields = [];
  List<Items> itemList = [
    Items()
      ..name = ""
      ..amount = 0,
  ];

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
            // Column(
            //   children: List.generate(
            //     2,
            //     (index) => InventoryRowInput(
            //         updateAmount: itemList[0].changeAmount,
            //         updateName: itemList[0].changeName),
            //   ),
            // ),
            const DynamicInventoryList(),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle submit button press
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
