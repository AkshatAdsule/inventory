import 'package:flutter/material.dart';

class InventoryRowInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final ValueChanged<String>? onTextChanged;
  final VoidCallback? onMinusPressed;
  final TextEditingController numberEditingController;
  final ValueChanged<String>? onNumberChanged;
  final VoidCallback? onPlusPressed;

  const InventoryRowInput({
    required this.textEditingController,
    this.onTextChanged,
    this.onMinusPressed,
    required this.numberEditingController,
    this.onNumberChanged,
    this.onPlusPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: TextField(
            controller: textEditingController,
            onChanged: onTextChanged,
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
            onChanged: onNumberChanged,
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
