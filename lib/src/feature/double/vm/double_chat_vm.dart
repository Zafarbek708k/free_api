import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class DoubleChatVm extends ChangeNotifier {
  TextEditingController msgController = TextEditingController();
  WebSocketChannel? channel;
  bool isLoading = true;

  final List<Data> messages = [];

  // Connect to WebSocket
  void connectWebSocket() async {
    isLoading = true;
    final wsUrl = Uri.parse('ws://10.10.2.30:4040/ws?uid=5556');
    channel = WebSocketChannel.connect(wsUrl);
    isLoading = false;

    channel!.stream.listen(
          (message) {
        // Assuming the incoming message is a Chat JSON object
        Chat chatMessage = Chat.fromJson(jsonDecode(message));
        if (chatMessage.data != null) {
          messages.add(chatMessage.data!);
          notifyListeners();
        }
      },
      onError: (error) {
        log("WebSocket Error: $error");
      },
      onDone: () {
        log("WebSocket closed");
      },
    );
  }

  void sendMessage({required String text}) {
    if (text.isNotEmpty) {
      final timestamp = DateTime.now().toIso8601String(); // Use ISO 8601 format for timestamps
      Data model = Data(
        id: "65456465", // Replace this with actual user ID
        status: "sent",
        from: "5556", // Replace this with actual user ID
        to: "azimjon", // Adjust based on your application logic
        content: text,
        timestamp: timestamp,
      );

      // Send the message as JSON
      Chat chatMessage = Chat(
        purpose: "message",
        data: model,
      );

      log(" ${chatMessage.data?.status  ?? "null"}");

      channel?.sink.add(jsonEncode(chatMessage.toJson()));
      messages.add(model); // Add the message to the local list
      msgController.clear(); // Clear input
      notifyListeners();
    }
  }

  @override
  void dispose() {
    msgController.dispose();
    channel?.sink.close();
    super.dispose();
  }
}

class Chat {
  final String? purpose;
  final Data? data;

  Chat({
    this.purpose,
    this.data,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    purpose: json["purpose"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "purpose": purpose,
    "data": data?.toJson(),
  };
}

class Data {
  final String? id;
  final String? status;
  final String? from;
  final String? to;
  final String? content;
  final String? timestamp;

  Data({
    this.id,
    this.status,
    this.from,
    this.to,
    this.content,
    this.timestamp,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    status: json["status"],
    from: json["from"],
    to: json["to"],
    content: json["content"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "from": from,
    "to": to,
    "content": content,
    "timestamp": timestamp,
  };
}