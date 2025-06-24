import 'package:flutter/material.dart';
import 'package:theme_yes_app/config/helpers/get_yes_no_answer.dart';
import 'package:theme_yes_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

    final ScrollController chatScrollController = ScrollController();

    final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

   List<Message> messageList = [
    Message(text: 'Hello!', fromWho: FromWho.hers),
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