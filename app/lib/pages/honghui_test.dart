import 'package:flutter/material.dart';
import 'package:inventory/widgets/common/InvertoryRowInput.dart';

import '../models/inventory.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final List<InventoryRowInput> inputFields = [];
  final List<Item> itemsAdded = [];

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
            ElevatedButton(
                onPressed: () => {
                      setState(() {
                        TextEditingController txt = TextEditingController();
                        TextEditingController num = TextEditingController();
                        inputFields.add(InventoryRowInput(
                            textEditingController: txt,
                            quantity:1,
                            numberEditingController: num));
                      })
                    },
                child: const Text("Add Item")),

            Expanded(
              child: ListView.builder(
                itemCount: inputFields.length,
                itemBuilder: (context, index) => inputFields[index],
              ),
            ),

            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                inputFields.forEach((InventoryRowInput entry) {
                  print(entry.textEditingController.text);
                  print(entry.numberEditingController.text);
                });
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
