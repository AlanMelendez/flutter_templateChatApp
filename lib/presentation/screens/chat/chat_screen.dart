import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_yes_app/domain/entities/message.dart';
import 'package:theme_yes_app/presentation/providers/chat_provider.dart';
import 'package:theme_yes_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:theme_yes_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:theme_yes_app/presentation/widgets/shared/message_field_box.dart';

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
        title: const Text('Alice'),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () {
              // Handle video call action
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Handle voice call action
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options action
            },
          ),
        ],
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

        final chatProvider = context.watch<ChatProvider>(); // Access the ChatProvider to manage chat state

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
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
