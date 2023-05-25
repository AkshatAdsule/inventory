import 'package:flutter/material.dart';
import './InventoryRowInput.dart';

class DynamicInventoryList extends StatefulWidget {
  const DynamicInventoryList({super.key});
  @override
  _DynamicInventoryListState createState() => _DynamicInventoryListState();
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

class _DynamicInventoryListState extends State<DynamicInventoryList> {
  List<Items> itemList = [
    Items()
      ..name = ""
      ..amount = 0,
  ];

  void addItem() {
    setState(() {
      itemList.add(Items()
        ..name = ""
        ..amount = 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0), 
      child: Column(
        children: [
          Column(
            children: List.generate(
              itemList.length,
              (index) => InventoryRowInput(
                  updateAmount: itemList[index].changeAmount,
                  updateName: itemList[index].changeName),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addItem();
            },
            child: const Text('Add Item'),
          ),
        ],
      ),
    );
  }
}
