import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.secondary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            child: Text(
              'I am fine, thank you!',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ),
        const SizedBox(height: 10.0), // Space between messages

        //TODO: Add image
      ],
    );
  }
}
