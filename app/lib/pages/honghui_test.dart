import 'package:flutter/material.dart';
import 'package:inventory/services/api.dart';
import 'package:inventory/widgets/common/InvertoryRowInput.dart';
import 'package:provider/provider.dart';

import '../models/inventory.dart';
import 'home/user_provider.dart';

class InventoryPage extends StatefulWidget {
  final String inventoryId;
  const InventoryPage({super.key, required this.inventoryId});

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
                            quantity: 1,
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
                onPressed: () => {
                      if (inputFields.isNotEmpty)
                        {
                          setState(() {
                            inputFields
                                .remove(inputFields[inputFields.length - 1]);
                          })
                        }
                    },
                child: const Text("Remove one entry")),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                List<String> input = [];
                for (var entry in inputFields) {
                  for (int i = 0;
                      i < int.parse(entry.numberEditingController.text);
                      i++) {
                    input.add(entry.textEditingController.text);
                  }
                }

                await APIService.instance.addItems(widget.inventoryId, input);
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
