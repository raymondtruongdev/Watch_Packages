library chat_bot;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.red),
    );
  }
}
