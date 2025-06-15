import 'package:flutter/material.dart';
import 'package:theme_yes_app/config/theme/app_theme.dart';
import 'package:theme_yes_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 5).theme,
      home: ChatScreen(),
    );
  }
}