import 'package:flutter/material.dart';

class TalkRoomScreen extends StatelessWidget {
  const TalkRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                children: [
                  _messageTile(
                    sender: "Mike Mazowski",
                    isAdmin: true,
                    message:
                        "Input your message in this section. If it’s shorter than one line, Please change variant. Input your message in this section.",
                    time: "16.04",
                    isMe: false,
                    avatarPath: "assets/user1.jpg",
                  ),
                  _messageTile(
                    sender: "Mike Mazowski",
                    message:
                        "Input your message in this section. If it’s shorter than one line, Please change variant. Input your message in this section.",
                    time: "16.04",
                    isMe: false,
                    avatarPath: "assets/user1.jpg",
                  ),
                  _messageTile(
                    sender: "Mike Mazowski",
                    message: "Input your message in this section. If",
                    time: "16.04",
                    isMe: false,
                    avatarPath: "assets/user1.jpg",
                  ),
                  _messageTile(
                    sender: "You",
                    message:
                        "Input your message in this section. If it’s shorter than one line",
                    time: "16.04",
                    isMe: true,
                    avatarPath: "assets/user2.jpg",
                  ),
                  _typingIndicator(),
                ],
              ),
            ),
            _bottomInputBar(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5))),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/talkroom.jpg"),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Talk Room",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  "7 Online, from 12 peoples",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Icon(Icons.videocam, color: Colors.grey[700]),
          const SizedBox(width: 8),
          const Icon(Icons.more_vert, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _messageTile({
    required String sender,
    required String message,
    required String time,
    required bool isMe,
    required String avatarPath,
    bool isAdmin = false,
  }) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isMe)
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(avatarPath),
              ),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  if (!isMe)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: RichText(
                        text: TextSpan(
                          text: sender,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFB8500),
                              fontSize: 12),
                          children: isAdmin
                              ? const [
                                  TextSpan(
                                    text: "  admin",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                  ),
                                ]
                              : [],
                        ),
                      ),
                    ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: isMe
                          ? const Color(0xFF2B72FF)
                          : const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: 14,
                        color: isMe ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
            if (isMe) const SizedBox(width: 8),
            if (isMe)
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(avatarPath),
              ),
          ],
        ),
      ),
    );
  }

  Widget _typingIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      child: Row(
        children: const [
          Icon(Icons.more_horiz, color: Colors.grey),
          SizedBox(width: 6),
          CircleAvatar(radius: 10, backgroundImage: AssetImage("assets/user1.jpg")),
          CircleAvatar(radius: 10, backgroundImage: AssetImage("assets/user2.jpg")),
          CircleAvatar(radius: 10, backgroundImage: AssetImage("assets/user3.jpg")),
          SizedBox(width: 6),
          Text("+2 others are typing",
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _bottomInputBar() {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
        color: Colors.white,
        child: Row(
          children: [
            const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write a message...',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Icon(Icons.mic, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
