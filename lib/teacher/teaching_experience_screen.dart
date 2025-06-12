import 'package:flutter/material.dart';
import 'class_selection_screen.dart';

class TeachingExperienceScreen extends StatefulWidget {
  @override
  _TeachingExperienceScreenState createState() =>
      _TeachingExperienceScreenState();
}

class _TeachingExperienceScreenState extends State<TeachingExperienceScreen> {
  String? selectedExperience;
  final TextEditingController previousOrgController = TextEditingController();

  final List<String> experienceOptions = [
    '0-1 years',
    '2 - 3 years',
    '5+ years',
  ];

  void _validateAndContinue() {
    if (selectedExperience == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select your teaching experience."),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // You can add further validation here if needed

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ClassSelectionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),

              // Back button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
              SizedBox(height: height * 0.02),

              // Title
              Text(
                "Kindly share your teaching experience for profile evaluation",
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: height * 0.04),

              // Dropdown label
              Text(
                "Enter your years of Teaching experience",
                style: TextStyle(fontSize: width * 0.04, color: Colors.black87),
              ),
              SizedBox(height: height * 0.015),

              // Dropdown menu
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text("Teaching Experience"),
                    value: selectedExperience,
                    items:
                        experienceOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedExperience = newValue;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),

              // Previous organizations label
              Text(
                "Have you taught anywhere previously? If yes, please share the details",
                style: TextStyle(
                  fontSize: width * 0.035,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: height * 0.01),

              // Previous organization input
              TextField(
                controller: previousOrgController,
                decoration: InputDecoration(
                  hintText: "Like Vedantu, BYJU’s, Coaching etc.",
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              // Extra space so button doesn't overlap on scroll
              SizedBox(height: height * 0.12),
            ],
          ),
        ),
      ),

      // Fixed continue button at bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _validateAndContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0066FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "Continue",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
