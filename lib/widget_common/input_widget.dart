import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.inputController,
    required this.label,
  }) : super(key: key);

  final TextEditingController inputController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      keyboardType: TextInputType.text,
    
      // Notice the const here right?
      // So the idea is that decoration objects could rebuild to either change one thing or the other, so 'label' here cannot be a constant
//So to solve this InputDecoration should not have const.
      decoration:  InputDecoration(
        border: const UnderlineInputBorder(),
        prefixIcon: const Icon(Icons.phone),
        labelText: label,
      ),
      validator: (value) {
        return value!.isEmpty ? 'enter value please' : null;
      },
    );
  }
}
