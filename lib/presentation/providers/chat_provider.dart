import 'package:flutter/material.dart';
import 'package:theme_yes_app/config/helpers/get_yes_no_answer.dart';
import 'package:theme_yes_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

    final ScrollController chatScrollController = ScrollController();

    final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

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

    if(text.isEmpty) return;

    final newMessage = Message(
      text: text,
      fromWho: FromWho.me,
    );

    messageList.add(newMessage);


    if(text.endsWith('?')) {
      // If the message ends with a question mark, get a reply from the API
      await herReply();
    } 

    notifyListeners(); // Notify listeners to update the UI is the same way like setState in StatefulWidget
    
    //Call mmoveScrollToBottom when receive a new message.
    moveScrollToBottom();
  }

  Future<void> herReply() async {

    final herMessage = await  getYesNoAnswer.getAnswer();

    messageList.add(herMessage);

    notifyListeners(); // Notify listeners to update the UI

    moveScrollToBottom(); // Call moveScrollToBottom when receive a new message
  }


  void moveScrollToBottom(){
    chatScrollController.animateTo( chatScrollController.position.maxScrollExtent , duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
  }
}