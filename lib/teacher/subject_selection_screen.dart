import 'package:flutter/material.dart';
import 'document_upload_screen.dart';

class SubjectSelectionScreen extends StatefulWidget {
  @override
  _SubjectSelectionScreenState createState() => _SubjectSelectionScreenState();
}

class _SubjectSelectionScreenState extends State<SubjectSelectionScreen> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  void _validateAndContinue() {
    final subject = subjectController.text.trim();
    final yearText = yearController.text.trim();

    if (subject.isEmpty || yearText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all the fields."),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final year = int.tryParse(yearText);
    if (year == null || year <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid year."),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // If all validations pass, navigate to next screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DocumentUploadScreen()),
    );
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
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),

              SizedBox(height: height * 0.02),

              Text(
                "Which subjects are you qualified and comfortable teaching?",
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: height * 0.03),

              TextField(
                controller: subjectController,
                decoration: InputDecoration(
                  hintText: "Like Maths, Physics , English, Biology etc.",
                  labelText: "Enter Subjects",
                  labelStyle: TextStyle(color: Colors.grey[700]),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),

              TextField(
                controller: yearController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter the year of completion",
                  labelText:
                      "If you're still pursuing your education, in which year is it expected to be completed?",
                  labelStyle: TextStyle(
                    color: Colors.grey[700],
                    fontSize: width * 0.035,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _validateAndContinue,
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
