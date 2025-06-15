import 'package:flutter/material.dart';


class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: const Color.fromARGB(255, 120, 216, 9), width: 1.0),
    );

    final inputDecoration = InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        hintText: 'Type a message',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            // Handle send action
            print('Value of the message field: ${context.findRenderObject()?.toString()}');
          },
        ),
      );

    return TextFormField(
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        // Handle send action when the user submits the field
        print('Value to press onFieldSubmitted: $value');
      },
      onChanged: (value) {
        // Handle changes in the message field
        print('Current value of the message field: $value');
      },
    );
  }
}