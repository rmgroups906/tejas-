import 'package:flutter/material.dart';
import 'package:tejas/screens/VerificationScreen.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  final FocusNode _node1 = FocusNode();
  final FocusNode _node2 = FocusNode();
  final FocusNode _node3 = FocusNode();
  final FocusNode _node4 = FocusNode();

  void _onConfirm() {
    final otp = _controllers.map((c) => c.text).join();
    if (otp == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => VerificationScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid OTP. Please try again.")),
      );
    }
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    _node1.dispose();
    _node2.dispose();
    _node3.dispose();
    _node4.dispose();
    super.dispose();
  }

  Widget _otpBox(int index, FocusNode node, FocusNode? nextNode) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextField(
        controller: _controllers[index],
        focusNode: node,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF0052CC), width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && nextNode != null) {
            FocusScope.of(context).requestFocus(nextNode);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Ensure layout scrolls on small screens
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: 20),
              const Text(
                "Verification Code",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "We have sent the verification code\nto your mobile number",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _otpBox(0, _node1, _node2),
                  _otpBox(1, _node2, _node3),
                  _otpBox(2, _node3, _node4),
                  _otpBox(3, _node4, null),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _onConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0052CC),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png', // make sure this path is correct
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
