import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _locationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLocationSet = false;

  void _checkIfValid() {
    setState(() {
      _isLocationSet = _locationController.text.trim().isNotEmpty;
    });
  }

  void _autoDetectLocation() {
    // Placeholder: Replace this with actual auto-detection logic
    setState(() {
      _locationController.text = "Auto-detected City";
      _isLocationSet = true;
    });
  }

  void _continue() {
    if (_isLocationSet) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter or detect your location.")),
      );
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
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
                "Where are you studying from?",
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: screenHeight * 0.01),

              // Subtitle
              Text(
                "This helps us match you with the right\nteachers and materials.",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              // Text Field inside Form
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _locationController,
                  onChanged: (_) => _checkIfValid(),
                  decoration: InputDecoration(
                    hintText: "Enter Your Location",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              const Center(child: Text("OR")),

              SizedBox(height: screenHeight * 0.02),

              // Auto Detect Button
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.065,
                child: ElevatedButton(
                  onPressed: _autoDetectLocation,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Auto - Detect my location",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              const Spacer(),

              // Illustration Image
              Center(
                child: Image.asset(
                  'assets/location_illustration.jpg',
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
                  onPressed: _continue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isLocationSet ? Colors.blue : Colors.grey.shade400,
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
