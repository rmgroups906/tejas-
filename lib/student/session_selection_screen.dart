import 'package:flutter/material.dart';
import 'location_screen.dart';

class SessionSelectionScreen extends StatefulWidget {
  const SessionSelectionScreen({Key? key}) : super(key: key);

  @override
  State<SessionSelectionScreen> createState() => _SessionSelectionScreenState();
}

class _SessionSelectionScreenState extends State<SessionSelectionScreen> {
  String? _selectedSlot;

  void _onContinuePressed() {
    if (_selectedSlot != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LocationScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a session slot.")),
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
                "Which time slot works best for you to take a session?",
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: screenHeight * 0.01),

              // Subtitle
              Text(
                "This will help us customize your learning experience.",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              // Dropdown container
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: DropdownButtonFormField<String>(
                  value: _selectedSlot,
                  isExpanded: true,
                  decoration: const InputDecoration(border: InputBorder.none),
                  hint: const Text("Select Session Slot"),
                  items:
                      [
                        'Morning (7 AM - 11 AM)',
                        'Afternoon (12 PM - 3 PM)',
                        'Evening (4 PM - 7 PM)',
                        'Night (8 PM - 10 PM)',
                      ].map((slot) {
                        return DropdownMenuItem<String>(
                          value: slot,
                          child: Text(slot),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedSlot = value;
                    });
                  },
                ),
              ),

              const Spacer(),

              // Image
              Center(
                child: Image.asset(
                  'assets/session_illustration.jpg', // Ensure this image exists
                  height: screenHeight * 0.25,
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
                        _selectedSlot != null
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
