import 'package:flutter/material.dart';
import 'subject_selection_screen.dart';

class ClassSelectionScreen extends StatefulWidget {
  @override
  _ClassSelectionScreenState createState() => _ClassSelectionScreenState();
}

class _ClassSelectionScreenState extends State<ClassSelectionScreen> {
  final List<String> classLevels = [
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

  List<String> selectedLevels = [];

  void onItemTap(String level) {
    setState(() {
      if (selectedLevels.contains(level)) {
        selectedLevels.remove(level);
      } else {
        selectedLevels.add(level);
      }
    });
  }

  void onContinue() {
    if (selectedLevels.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one class level.'),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SubjectSelectionScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),

              // Back button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),

              SizedBox(height: height * 0.02),

              // Title
              Text(
                "Which class levels are you comfortable teaching?",
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: height * 0.01),

              // Subtitle
              Text(
                "Select 1 or more class levels",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: width * 0.035,
                ),
              ),

              SizedBox(height: height * 0.03),

              // Class levels list
              Expanded(
                child: ListView.builder(
                  itemCount: classLevels.length,
                  itemBuilder: (context, index) {
                    final level = classLevels[index];
                    return CheckboxListTile(
                      title: Text(level),
                      value: selectedLevels.contains(level),
                      onChanged: (_) => onItemTap(level),
                      activeColor: const Color(0xFF0066FF),
                      controlAffinity: ListTileControlAffinity.trailing,
                    );
                  },
                ),
              ),

              // Continue button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0066FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
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
              ),

              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
