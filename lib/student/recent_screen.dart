import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'ai_chat_screen.dart';
import 'tejas_talk_screen.dart';
import 'profile_screen.dart';

class RecentScreen extends StatelessWidget {
  final List<Map<String, dynamic>> classData = [
    {
      "title": "Grammar Class",
      "status": "Completed Successfully",
      "tutor": "Tutor Name",
      "date": "16 Sep 2023 16:08 PM",
      "timeLeft": "53 mins",
    },
    {
      "title": "Science Class",
      "status": "Completed Successfully",
      "tutor": "Tutor Name",
      "date": "16 Sep 2023 16:08 PM",
      "timeLeft": "65 mins",
    },
    {
      "title": "Logical ability Session",
      "status": "25 Mins left to Complete",
      "tutor": "Tutor Name",
      "date": "16 Sep 2023 16:08 PM",
      "timeLeft": "125 mins",
    },
    {
      "title": "Coding in Python",
      "status": "25 Mins left to Complete",
      "tutor": "Tutor Name",
      "date": "16 Sep 2023 16:08 PM",
      "timeLeft": "45 mins",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Top Rated Tutors ⭐⭐⭐⭐⭐",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset("assets/tutor1.jpg", height: 100, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset("assets/tutor2.jpg", height: 100, fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0052CC),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text("previous class"),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Downloads",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: classData.length,
                  itemBuilder: (context, index) {
                    final data = classData[index];
                    return ClassCard(
                      title: data["title"],
                      status: data["status"],
                      tutor: data["tutor"],
                      date: data["date"],
                      timeLeft: data["timeLeft"],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF0052CC),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TejasTalkScreen()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AiChatScreen()));
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
                  Text(
                    'AI',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 36, 91),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'chat',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 36, 91),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Recent'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  final String title;
  final String status;
  final String tutor;
  final String date;
  final String timeLeft;

  const ClassCard({
    required this.title,
    required this.status,
    required this.tutor,
    required this.date,
    required this.timeLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xFFE4EBFF),
            child: Image.asset(
              'assets/logo.png', // Replace this with your actual logo image path
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  status,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                Text(
                  "By $tutor",
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFD7F7D4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              timeLeft,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
