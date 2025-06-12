import 'package:flutter/material.dart';
import 'video_chat_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  List<Map<String, dynamic>> messages = [
    {
      "name": "Mike Mazowski",
      "message":
          "Input your message in this section. If it’s shorter than one line, Please change variant. Input your message in this section.",
      "isSender": false,
      "time": "16.04",
    },
    {
      "name": "Mike Mazowski",
      "message":
          "Input your message in this section. If it’s shorter than one line, Please change variant. Input your message in this section.",
      "isSender": false,
      "time": "16.04",
    },
    {
      "name": "Mike Mazowski",
      "message": "Input your message in this section. If",
      "isSender": false,
      "time": "16.04",
    },
    {
      "name": "You",
      "message":
          "Input your message in this section. If it’s shorter than one line",
      "isSender": true,
      "time": "16.04",
    },
  ];

  void _showCallPopup() {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text("Voice Call"),
            content: const Text("Do you want to call now?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  // Implement call logic here
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Calling...")));
                },
                child: const Text("Call Now"),
              ),
            ],
          ),
    );
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      messages.add({
        "name": "You",
        "message": _controller.text.trim(),
        "isSender": true,
        "time": "16.04",
      });
      _controller.clear();
      _isTyping = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Row(
          children: [
            const CircleAvatar(backgroundImage: AssetImage('assets/user1.jpg')),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'My Tutor',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  'Online',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.blue),
            onPressed: () {
             Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => VideoCallScreen(
                        channelName: 'My_New_Project',
                        appId: 'e67e23dc3bfe4b1e8531e2c00b140e53',
                      ),
                ),
              );

            },
          ),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.blue),
            onPressed: _showCallPopup,
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isSender = msg['isSender'] as bool;
                return Align(
                  alignment:
                      isSender ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    constraints: BoxConstraints(maxWidth: size.width * 0.75),
                    decoration: BoxDecoration(
                      color:
                          isSender
                              ? const Color(0xFF006CFF)
                              : const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isSender)
                          Text(
                            msg["name"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue,
                            ),
                          ),
                        Text(
                          msg["message"],
                          style: TextStyle(
                            color: isSender ? Colors.white : Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            msg["time"],
                            style: TextStyle(
                              fontSize: 10,
                              color:
                                  isSender
                                      ? Colors.white70
                                      : Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onChanged:
                        (val) =>
                            setState(() => _isTyping = val.trim().isNotEmpty),
                    decoration: InputDecoration(
                      hintText: "Write a message...",
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (_isTyping)
                  GestureDetector(
                    onTap: _sendMessage,
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Text(
              "My tutor is typing",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
