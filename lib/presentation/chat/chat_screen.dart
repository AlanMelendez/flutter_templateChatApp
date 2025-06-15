import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(9.0),
          child: CircleAvatar(
            // backgroundImage: const AssetImage('assets/images/avatar.png'),
            backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/123456789?v=4',
            ),
            radius: 20,
            child: Text(
              'A',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
        title: const Text('Mi Amor'),
        centerTitle: true,
      ),
    );
  }
}