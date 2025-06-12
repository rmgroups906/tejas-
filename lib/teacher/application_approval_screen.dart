import 'package:flutter/material.dart';

class ApplicationApprovalScreen extends StatelessWidget {
  const ApplicationApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),

                    // Graduation Icon
                    Image.asset(
                      'assets/logo.png', // Replace with actual path
                      height: 60,
                    ),
                    SizedBox(height: 20),

                    // Title
                    Text(
                      'Thank You',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Subtitle
                    Text(
                      'For Getting In Touch With Us',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 30),

                    // Green checkmark
                    Image.asset(
                      'assets/checkmark.jpg', // Replace with actual path
                      height: 100,
                    ),
                    SizedBox(height: 30),

                    // Under review message
                    Text(
                      '* Your application is under review.\nWe’ll notify you once it’s approved.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 30),

                    // Bottom illustration
                    Image.asset(
                      'assets/thankyou_illustration.jpg', // Replace with actual path
                      width: screenWidth * 0.9,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
