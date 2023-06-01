import 'package:flutter/material.dart';

class InventoryRowInput extends StatelessWidget {
  final TextEditingController textEditingController;
  //final VoidCallback? onMinusPressed; // delete once implement
  final TextEditingController numberEditingController;
  //final VoidCallback? onPlusPressed; // delete once implement

  int quantity;

  InventoryRowInput({
    required this.textEditingController,
    required this.quantity,
    required this.numberEditingController,
    //this.onPlusPressed,
  }) {
    textEditingController.text = "";
    numberEditingController.text = "1";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              hintText: 'Enter Item',
            ),
          ),
        ),
        Expanded(child: Container()),
        ElevatedButton(
          onPressed: () {
            quantity = int.parse(numberEditingController.text);
            quantity--;
            numberEditingController.text = quantity.toString();
          },
          child: const Text('-'),
        ),
        SizedBox(
          width: 20,
          child: TextField(
            controller: numberEditingController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: '1',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            quantity = int.parse(numberEditingController.text);
            quantity++;
            numberEditingController.text = quantity.toString();
          },
          child: const Text('+'),
        ),
      ],
    );
  }
}
