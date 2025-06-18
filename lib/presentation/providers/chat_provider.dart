import 'package:flutter/material.dart';
import 'package:theme_yes_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final List<Message> _messages = [
    Message(text: 'Hello!', fromWho: FromWho.hers),
    Message(text: 'Hi there!', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    
  }
}