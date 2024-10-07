import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class Message {
  final String text;
  final bool isSent;

  Message({required this.text, required this.isSent});
}

class ChatVm extends ChangeNotifier {
  TextEditingController messageController = TextEditingController();
  WebSocketChannel? channel;
  bool isLoading = true;

  final List<Message> messages = [];

  // Connect to WebSocket
  void connectWebSocket() async {
    isLoading = true;
    final wsUrl = Uri.parse('ws://10.10.1.219:3000');
    channel = WebSocketChannel.connect(wsUrl);
    isLoading = false;

    // Listen to messages from the server
    channel!.stream.listen((message) {
      messages.add(Message(text: message, isSent: false));  // Add received message to the list
      notifyListeners();
    }, onError: (error) {
      log("WebSocket Error: $error");
    }, onDone: () {
      log("WebSocket closed");
    });
  }

  // Send message to the server
  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      final message = messageController.text;
      channel?.sink.add(message);  // Send the message
      messages.add(Message(text: message, isSent: true)); // Add sent message to the list
      messageController.clear();   // Clear input
      notifyListeners();
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    channel?.sink.close();
    super.dispose();
  }
}