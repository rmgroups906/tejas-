import 'package:flutter/material.dart';
import 'education_qualification_screen.dart';

class TeacherLanguageSelectionScreen extends StatefulWidget {
  @override
  _TeacherLanguageSelectionScreenState createState() => _TeacherLanguageSelectionScreenState();
}

class _TeacherLanguageSelectionScreenState extends State<TeacherLanguageSelectionScreen> {
  String selectedLanguage = 'English';

  final List<Map<String, String>> languages = [
    {'label': 'ENGLISH', 'value': 'English', 'short': 'EN'},
    {'label': 'HINDI', 'value': 'Hindi', 'short': 'हिं'},
    {'label': 'TAMIL', 'value': 'Tamil', 'short': 'தமி'},
    {'label': 'MALAYALAM', 'value': 'Malayalam', 'short': 'മലയ'},
  ];

  void _onContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EducationQualificationScreen()), // Update if needed
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, size: 28),
              ),
              const SizedBox(height: 20),
              const Text(
                "Choose Your Preferred\nLanguage of Educating",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Select any 1 or both of the languages",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
              const SizedBox(height: 30),

              // Language Options
              ...languages.map((lang) {
                bool isSelected = selectedLanguage == lang['value'];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLanguage = lang['value']!;
                      });
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF0052CC) : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Text(
                              lang['short']!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            lang['label']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),

              const Spacer(),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0052CC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 3,
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
