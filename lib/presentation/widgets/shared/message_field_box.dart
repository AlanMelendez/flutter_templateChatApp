import 'package:flutter/material.dart';


class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();

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

            final message = textController.value.text;
            // Handle send action
            print('Value of the message field: $message');

            textController.clear(); // Clear the field after sending
          },
        ),
      );

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        // Handle send action when the user submits the field
        print('Value to press onFieldSubmitted: $value');
        textController.clear(); // Clear the field after sending
        focusNode.requestFocus(); // Keep focus on the text field
      },
      onTapOutside: (event) {
        // Handle tap outside the text field to unfocus
        focusNode.unfocus();
      },
      // onChanged: (value) {
      //   // Handle changes in the message field
      //   print('Current value of the message field: $value');
      // },
    );
  }
}