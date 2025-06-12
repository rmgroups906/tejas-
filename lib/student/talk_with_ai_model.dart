import 'package:flutter/material.dart';
import 'listening_screen.dart';
class TalkWithAiModelScreen extends StatefulWidget {
  @override
  _TalkWithAiModelScreenState createState() => _TalkWithAiModelScreenState();
}

class _TalkWithAiModelScreenState extends State<TalkWithAiModelScreen> {
  bool isMaleSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Close Button
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 10),

                // Title
                Text(
                  'Talk with our',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Subtitle
                Text(
                  'AI model',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),

                SizedBox(height: 20),

                // Choose One Label
                Text(
                  'Choose One',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 10),

                // Gender Toggle Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isMaleSelected = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isMaleSelected ? Colors.blue.shade100 : Colors.grey.shade200,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text("Male Model"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isMaleSelected = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                !isMaleSelected ? Colors.pink.shade100 : Colors.grey.shade200,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text("Female Model"),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Avatar with Speech Bubble
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Image.asset(
                      isMaleSelected ? 'assets/male.png' : 'assets/female.png',
                      height: 250,
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Hey, Name!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Welcome Text
                Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),

                Text(
                  'How Can I Help You Today?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),

                SizedBox(height: 20),

                // Tap to Talk Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ListeningScreen()), // <-- Replace with your actual screen
    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  ),
                  icon: Icon(Icons.mic),
                  label: Text("Tap To Talk"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
