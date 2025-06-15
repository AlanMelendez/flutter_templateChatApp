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
            child: Text(
              'A',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
          ),
        ),
        title: const Text('Mi Amor'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  // const _ChatView({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Ensure the content is not obscured by system UI (like the notch or status bar)
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ), // Add padding to the entire body
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  index++; // Increment index for display purposes
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/123456789?v=$index',
                      ),
                    ),
                    title: Text('Mensaje $index'),
                    subtitle: Text('Este es el contenido del mensaje $index'),
                  );
                },
              ),
            ),
            Text('Hola, ¿cómo estás?'),
          ],
        ),
      ),
    );
  }
}
