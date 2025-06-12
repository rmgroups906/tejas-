import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, size: 100, color: Color(0xFF0052CC)),
            const SizedBox(height: 30),
            const Text(
              "Success!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Congratulations! You have been\nsuccessfully authenticated",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/logo.png', // replace with your correct path
              height: 80,
            ),
            const SizedBox(height: 8),
            const Text(
              "TEJAS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF003366),
              ),
            ),
            const Text(
              "Learning",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF003366),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/namegender');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0052CC),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
