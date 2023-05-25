import 'package:flutter/material.dart';

typedef NameCallback = void Function(String);
typedef AmountCallback = void Function(String);

class InventoryRowInput extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController numberEditingController = TextEditingController();
  final void Function(String) updateName;
  final void Function(int) updateAmount;
  
  void onNameChanged(value){
    updateName(value);
  }

  void onAmountChanged(value) {
    updateAmount(int.parse(value));
  }

  void onMinusPressed() {
    int num = int.parse(numberEditingController.text);
    num--;
    numberEditingController.text = num.toString();
    updateAmount(num);
  }

  void onPlusPressed() {
    int num = int.parse(numberEditingController.text);
    num++;
    numberEditingController.text = num.toString();
    updateAmount(num);
  }

  InventoryRowInput({
    required this.updateName,
    required this.updateAmount,
    super.key
  }) {
    int num = 0;
    numberEditingController.text = num.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: TextField(
            controller: textEditingController,
            onChanged: onNameChanged,
            decoration: const InputDecoration(
              hintText: '    Enter text 1',
            ),
          ),
        ),
        const SizedBox(
          width: 400,
        ),
        ElevatedButton(
          onPressed: onMinusPressed,
          child: const Text('-'),
        ),
        SizedBox(
          width: 10,
          child: TextField(
            controller: numberEditingController,
            keyboardType: TextInputType.number,
            onChanged: onAmountChanged,
            decoration: const InputDecoration(
              hintText: '0',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onPlusPressed,
          child: const Text('+'),
        ),
      ],
    );
  }
}
