import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_api/riverpod.dart';
import 'package:free_api/src/core/constants/context_extension.dart';
import 'package:free_api/src/core/widgets/text_widget.dart';

class Chat extends ConsumerStatefulWidget {
  const Chat({super.key});

  @override
  ChatState createState() => ChatState();
}

class ChatState extends ConsumerState<Chat> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.read(chatController).connectWebSocket();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(chatController);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget(
          "Chat App",
          textColor: context.appTheme.secondary,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: context.appTheme.primary,
        iconTheme: IconThemeData(color: context.appTheme.secondary),
      ),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView.builder(
          itemCount: controller.messages.length,
          itemBuilder: (context, index) {
            final message = controller.messages[index];
            return Align(
              alignment: message.isSent ? Alignment.centerRight : Alignment.centerLeft,
              child: ChatBubble(
                message: message.text,
                isSent: message.isSent,
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TF(
        controller: controller.messageController,
        iconPressed: () {
          controller.sendMessage();
        },
      ),
    );
  }
}

class TF extends StatelessWidget {
  const TF({super.key, required this.controller, required this.iconPressed});

  final TextEditingController controller;
  final VoidCallback iconPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: controller,
        style: TextStyle(color: context.appTheme.secondary),
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                Icons.send,
                color: context.appTheme.secondary,
              ),
              onPressed: iconPressed,
            ),
            hintText: "Enter message",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: context.appTheme.secondary)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: context.appTheme.secondary))),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSent;

  const ChatBubble({super.key, required this.message, required this.isSent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isSent ? Colors.blueAccent : Colors.grey[300],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        message,
        style: TextStyle(color: isSent ? Colors.white : Colors.black),
      ),
    );
  }
}
