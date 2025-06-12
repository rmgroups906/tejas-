import 'package:flutter/material.dart';
import 'package:tejas/student/language_selection_screen.dart';
import 'package:tejas/teacher/language_selection_screen.dart';

class RoleSelectionScreen extends StatefulWidget {
  @override
  _RoleSelectionScreenState createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String selectedRole = 'student';

  void _onContinue() {
    if (selectedRole == 'student') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => LanguageSelectionScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => TeacherLanguageSelectionScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Arrow
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, size: 28),
              ),
              SizedBox(height: 20),

              // Title and icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Join Tejas as a\nStudent or Educator ?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/logo.png', // replace with your actual asset path
                    height: 50,
                  ),
                ],
              ),
              SizedBox(height: 40),

              // Student Card
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRole = 'student';
                  });
                },
                child: RoleOptionCard(
                  iconPath: 'assets/student.jpg',
                  title: "As a Student",
                  isSelected: selectedRole == 'student',
                ),
              ),
              SizedBox(height: 20),

              // Tutor Card
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRole = 'educator';
                  });
                },
                child: RoleOptionCard(
                  iconPath: 'assets/tutor.jpg',
                  title: "As a Tutor",
                  isSelected: selectedRole == 'educator',
                ),
              ),

              Spacer(),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0052CC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 6,
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleOptionCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final bool isSelected;

  const RoleOptionCard({
    required this.iconPath,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFE6F0FF) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(2, 3),
                ),
              ],
            ),
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
