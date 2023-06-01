import 'package:flutter/material.dart';
import './InventoryRowInput.dart';

class DynamicInventoryList extends StatefulWidget {
  final void Function(List<Items>) onSubmit;
  const DynamicInventoryList({required this.onSubmit, super.key});
  
  @override
  DynamicInventoryListState createState() => DynamicInventoryListState(onSubmit: onSubmit);
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

void removeItem(String name) {

}

class DynamicInventoryListState extends State<DynamicInventoryList> {
  final void Function(List<Items>) onSubmit;
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

  DynamicInventoryListState({required this.onSubmit});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: List.generate(
                itemList.length,
                (index) => InventoryRowInput(
                    updateAmount: itemList[index].changeAmount,
                    updateName: itemList[index].changeName,
                    removeItem: removeItem,
                    name: itemList[index].name,
                    amount: itemList[index].amount,
                    ),
                    

              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addItem();
            },
            child: const Text('Add Item'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              onSubmit(itemList);
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}
