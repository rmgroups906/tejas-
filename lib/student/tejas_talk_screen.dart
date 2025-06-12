import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'ai_chat_screen.dart';
import 'recent_screen.dart';
import 'HomeScreen.dart';
import 'grammar_buddy.dart';
import 'talk_with_ai_model.dart';
import 'talk_room.dart';

class TejasTalkScreen extends StatelessWidget {
  const TejasTalkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F3FB),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF0052CC),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          } else if (index == 1) {
            // Stay on current screen
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AiChatScreen()));
          } else if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RecentScreen()));
          } else if (index == 4) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildHeader(),
              const SizedBox(height: 16),
              _buildProgressCard(),
              const SizedBox(height: 16),
              _buildFeatureCards(context),
              const SizedBox(height: 16),
              _buildLearningPlanCard(),
              const SizedBox(height: 16),
              _buildMeetupCard(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Hi, Kristin", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text("Let’s start learning", style: TextStyle(fontSize: 14, color: Colors.black54)),
          ],
        ),
        const Spacer(),
        Image.asset("assets/logo.png", width: 48, height: 48),
      ],
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD4E6F8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
            Text("Learned today", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text("My courses", style: TextStyle(color: Colors.blue)),
          ]),
          const SizedBox(height: 10),
          Row(children: const [
            Text("46min", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text(" / 60min", style: TextStyle(color: Colors.black45)),
          ]),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: 46 / 60,
            backgroundColor: Colors.grey.shade300,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCards(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildImageFeatureCard(
            context: context,
            imagePath: "assets/grammar_icon.jpg",
            title: "Do you want to\nlearn grammar ?",
            buttonText: "Get Started",
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GrammarBuddyScreen())),
          ),
          _buildImageFeatureCard(
            context: context,
            imagePath: "assets/ai_icon.jpg",
            title: "Do you want to\ntalk with AI Bot ?",
            buttonText: "Try Now",
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TalkWithAiModelScreen())),
          ),
          _buildImageFeatureCard(
            context: context,
            imagePath: "assets/talk_icon.jpg",
            title: "Do you want to\nchat with your\nfriends",
            buttonText: "Get Started",
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TalkRoomScreen())),
          ),
        ],
      ),
    );
  }

  static Widget _buildImageFeatureCard({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Image.asset(imagePath, width: 60, height: 60),
            const SizedBox(height: 8),
            Expanded(
              child: Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13)),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(30),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: onPressed,
              child: Text(buttonText, style: const TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildLearningPlanCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRadioLearningRow("Packaging Design", 40, 48, isSelected: true),
          const SizedBox(height: 12),
          _buildRadioLearningRow("Product Design", 6, 24),
          const SizedBox(height: 10),
          const Text("more", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  static Widget _buildRadioLearningRow(String title, int current, int total, {bool isSelected = false}) {
    return Row(
      children: [
        Icon(
          Icons.radio_button_checked,
          color: isSelected ? Colors.blue : Colors.black,
          size: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(title, style: const TextStyle(fontSize: 14)),
        ),
        Text("$current/$total", style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  static Widget _buildMeetupCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Meetup", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Off-line exchange of learning experiences", style: TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ClipOval(
            child: Image.asset('assets/meetup.jpg', width: 60, height: 60, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
