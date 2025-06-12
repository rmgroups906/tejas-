import 'package:flutter/material.dart';
import 'session_selection_screen.dart';

class ScienceScreen extends StatefulWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  String? _selectedExam;

  void _onContinuePressed() {
    if (_selectedExam != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SessionSelectionScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select your target exam.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Title
              Text(
                "Set Your Target Exam in the\nScience Stream",
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: screenHeight * 0.01),

              // Subtitle
              Text(
                "\"Explore the World Through Logic,\nExperiments & Discovery\"",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              // Dropdown
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: DropdownButtonFormField<String>(
                  value: _selectedExam,
                  isExpanded: true,
                  decoration: const InputDecoration(border: InputBorder.none),
                  hint: const Text("Select your Target Exam"),
                  items:
                      ['JEE Main', 'JEE Advanced', 'NEET', 'Board Exams'].map((
                        exam,
                      ) {
                        return DropdownMenuItem<String>(
                          value: exam,
                          child: Text(exam),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedExam = value;
                    });
                  },
                ),
              ),

              const Spacer(),

              // Illustration Image
              Center(
                child: Image.asset(
                  'assets/science_lab.jpg', // Make sure the image exists
                  height: screenHeight * 0.25,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.07,
                child: ElevatedButton(
                  onPressed: _onContinuePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _selectedExam != null
                            ? Colors.blue
                            : Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
