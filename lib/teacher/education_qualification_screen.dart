import 'package:flutter/material.dart';
import 'teaching_experience_screen.dart';

class EducationQualificationScreen extends StatefulWidget {
  @override
  _EducationQualificationScreenState createState() =>
      _EducationQualificationScreenState();
}

class _EducationQualificationScreenState
    extends State<EducationQualificationScreen> {
  bool isOngoing = true;
  final TextEditingController universityController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();

  void _validateAndContinue() {
    final university = universityController.text.trim();
    final qualification = qualificationController.text.trim();

    if (university.isEmpty || qualification.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all the required fields."),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TeachingExperienceScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: width * 0.06,
          right: width * 0.06,
          bottom: height * 0.02,
        ),
        child: SizedBox(
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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

              // Title
              Text(
                "Kindly share your educational qualifications to help us assess your teaching profile",
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: height * 0.04),

              // Education Status
              Text(
                "Education status",
                style: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: height * 0.015),
              Row(
                children: [
                  // Ongoing Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isOngoing = true),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: height * 0.018),
                        decoration: BoxDecoration(
                          color:
                              isOngoing
                                  ? const Color(0xFF2F3C88)
                                  : const Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Ongoing",
                          style: TextStyle(
                            color: isOngoing ? Colors.white : Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.04),
                  // Completed Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isOngoing = false),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: height * 0.018),
                        decoration: BoxDecoration(
                          color:
                              !isOngoing
                                  ? const Color(0xFF2F3C88)
                                  : const Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Completed",
                          style: TextStyle(
                            color: !isOngoing ? Colors.white : Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.04),

              // University Field
              Text(
                "University/Institute",
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.grey.shade800,
                ),
              ),
              SizedBox(height: height * 0.01),
              TextField(
                controller: universityController,
                decoration: InputDecoration(
                  hintText: "Enter University/Institute",
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),

              // Qualification Field
              Text(
                "Highest educational qualification",
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.grey.shade800,
                ),
              ),
              SizedBox(height: height * 0.01),
              TextField(
                controller: qualificationController,
                decoration: InputDecoration(
                  hintText: "Like MSc, B.Sc, B.Tech etc",
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: height * 0.1), // Extra spacing for scroll
            ],
          ),
        ),
      ),
    );
  }
}
