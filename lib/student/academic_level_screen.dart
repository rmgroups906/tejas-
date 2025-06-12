import 'package:flutter/material.dart';
import 'student_stream_selection_screen.dart';

class AcademicLevelScreen extends StatefulWidget {
  @override
  _AcademicLevelScreenState createState() => _AcademicLevelScreenState();
}

class _AcademicLevelScreenState extends State<AcademicLevelScreen> {
  String? selectedLevel;

  final List<String> levels = [
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
    'Class 11',
    'Class 12',
    'Class 12 Passed (Dropper)',
    'Undergraduation (B.Tech/BSc)',
    'Government Job Aspirant',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What’s Your Current\nAcademic Level?",
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: levels.map((level) {
                      return RadioListTile<String>(
                        title: Text(level),
                        value: level,
                        groupValue: selectedLevel,
                        onChanged: (value) {
                          setState(() {
                            selectedLevel = value;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: selectedLevel == null
                      ? null
                      : () {
                         Navigator.push(context,MaterialPageRoute(builder: (_) => StudentStreamSelectionScreen()),);
                          print("Selected Level: $selectedLevel");
                        },
                  child: Text("Continue", style: TextStyle(fontSize: 16, color: Colors.white, )),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
