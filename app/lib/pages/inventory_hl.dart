import 'package:flutter/material.dart';
import '../widgets/InventoryRowInput.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final List<InventoryRowInput> inputFields = [];

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
            InventoryRowInput(
              textEditingController: TextEditingController(),
              onTextChanged: (value) {
                // Handle text changes
              },
              onMinusPressed: () {
                // Handle minus button press
              },
              numberEditingController: TextEditingController(),
              onNumberChanged: (value) {
                // Handle number changes
              },
              onPlusPressed: () {
                // Handle plus button press
              },
            ),
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
