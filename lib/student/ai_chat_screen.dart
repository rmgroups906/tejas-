import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'tejas_talk_screen.dart';
import 'profile_screen.dart';
import 'recent_screen.dart';

class AiChatScreen extends StatelessWidget {
  const AiChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF0052CC),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => TejasTalkScreen()));
          } else if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => RecentScreen()));
          } else if (index == 4) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Tejas Talk'),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 68, 151, 229),
              radius: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('AI', style: TextStyle(color: Color(0xFF00245B), fontWeight: FontWeight.bold, fontSize: 12)),
                  Text('chat', style: TextStyle(color: Color(0xFF00245B), fontSize: 10)),
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Recent'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "AI-Chat",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00245B),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset('assets/bot1.jpg', height: width * 0.5),
                    const SizedBox(height: 16),
                    const Text(
                      "Hello, Name!",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "I'm here to help you, anytime you need!",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // User message bubble
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text("Why is the sky blue?"),
                            ),
                          ),
                          const CircleAvatar(
                            radius: 16,
                            backgroundImage: AssetImage('assets/user.jpg'),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // AI message bubble
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const CircleAvatar(
                            radius: 16,
                            backgroundImage: AssetImage('assets/bot.jpg'),
                            backgroundColor: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(14),
                                  margin: const EdgeInsets.only(bottom: 24),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF00245B),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Text(
                                    "The sky appears blue because blue light from the sun scatters more in the atmosphere than other colors. This scattering, called Rayleigh scattering, is stronger for shorter wavelengths like blue, making the sky look blue to our eyes.",
                                    style: TextStyle(color: Colors.white, fontSize: 13),
                                  ),
                                ),
                                const Positioned(
                                  bottom: 2,
                                  right: 10,
                                  child: Row(
                                    children: [
                                      Icon(Icons.copy, size: 18, color: Colors.white),
                                      SizedBox(width: 8),
                                      Icon(Icons.share, size: 18, color: Colors.white),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Chat Input Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const Icon(Icons.mic_none, color: Colors.grey),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "How can I assist you today?",
                        hintStyle: TextStyle(fontSize: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(Icons.send, color: Color(0xFF0072FF)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
