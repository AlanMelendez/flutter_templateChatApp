import 'package:flutter/material.dart';
import 'package:theme_yes_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {


   List<Message> messageList = [
    Message(text: 'Hello!', fromWho: FromWho.hers),
    Message(text: 'Hi there!', fromWho: FromWho.me),
    Message(text: 'How are you?', fromWho: FromWho.hers),
    Message(text: 'I am good, thanks! And you?', fromWho: FromWho.me),
    Message(text: 'Doing well, just working on some projects.', fromWho: FromWho.hers),
    Message(text: 'That sounds interesting! What kind of projects?', fromWho: FromWho.me),
    Message(text: 'I am building a Flutter app.', fromWho: FromWho.hers),
    Message(text: 'Oh, nice! I love Flutter.', fromWho: FromWho.me),
    Message(text: 'Me too! It\'s a great framework for building apps.', fromWho: FromWho.hers),
    Message(text: 'Absolutely! Do you have any tips for someone new to Flutter?', fromWho: FromWho.me),
    Message(text: 'Sure! Start with the official documentation and try building small apps to get the hang of it.', fromWho: FromWho.hers),
    Message(text: 'That\'s great advice, thanks! I will definitely check it out.', fromWho: FromWho.me),
    
  ];

  Future<void> sendMessage(String text) async {
    
  }
}