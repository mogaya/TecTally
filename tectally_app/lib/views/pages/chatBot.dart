import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tectally_app/views/components/customText.dart';

class ChatBot extends StatefulWidget {
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages =
      []; // To track sender and message separately

  Future<void> sendMessage() async {
    if (_controller.text.isEmpty) return;

    String userMessage = _controller.text;
    setState(() {
      messages.add({"sender": "You", "message": userMessage});
    });

    // Send the message to Dialogflow via PHP script
    final response = await http.post(
      Uri.parse("https://mmogaya.com/tectally/chat_bot.php"),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "queryInput": {
          "text": {
            "text": userMessage,
            "languageCode": "en",
          },
        },
      }),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        messages.add({"sender": "Hekima", "message": data['fulfillmentText']});
      });
    } else {
      setState(() {
        messages.add(
            {"sender": "Bot", "message": "Error connecting to the server."});
      });
    }

    _controller.clear();
  }

  Widget buildChatBubble(String message, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isUser ? Colors.blueAccent : Colors.grey.shade300,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: isUser ? Radius.circular(15) : Radius.zero,
            bottomRight: isUser ? Radius.zero : Radius.circular(15),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: isUser ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const customText(
          label: 'Ask Hekima',
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var message = messages[index];
                bool isUser = message["sender"] == "You";
                return buildChatBubble(message["message"]!, isUser);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
