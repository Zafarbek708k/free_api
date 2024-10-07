import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_api/src/core/constants/context_extension.dart';
import '../../../../../riverpod.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../../chat/view/pages/chat.dart';

class DoubleChat extends ConsumerStatefulWidget {
  const DoubleChat({super.key});

  @override
  DoubleChatState createState() => DoubleChatState();
}

class DoubleChatState extends ConsumerState<DoubleChat> {
  @override
  void didChangeDependencies() {
    ref.read(doubleChatController).connectWebSocket();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(doubleChatController);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget(
          "Double Chat App",
          textColor: context.appTheme.secondary,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: context.appTheme.primary,
        iconTheme: IconThemeData(color: context.appTheme.secondary),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              reverse: false,
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                final message = controller.messages[index];
                bool isMe = message.from == "5556"; // Adjust based on your user ID logic
                return Container(
                  padding: const EdgeInsets.all(8),
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue[200] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(12),
                    child:  Text(
                     message.content??"null",
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 120), // Space between ListView and TextField
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  TF(
        controller: controller.msgController,
        iconPressed: () {
          controller.sendMessage(text: controller.msgController.text);
        },
      ),
    );
  }
}





