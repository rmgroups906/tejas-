import 'package:flutter/material.dart';
import 'package:tejas/screens/role_selection_screen.dart';

class NameGenderScreen extends StatefulWidget {
  @override
  _NameGenderScreenState createState() => _NameGenderScreenState();
}

class _NameGenderScreenState extends State<NameGenderScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String? _gender;

  bool get _isFormValid {
    return _formKey.currentState?.validate() == true && _gender != null;
  }

  void _onContinue() {
    if (_formKey.currentState?.validate() != true || _gender == null) {
      // Show error snackbar if validation fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your name and select a gender.")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => RoleSelectionScreen()),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your full name';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              onChanged:
                  () => setState(
                    () {},
                  ), // To update Continue button enabled state
              child: Column(
                children: [
                  // Illustration
                  Image.asset('assets/gender_image.jpg', width: width * 0.8),

                  SizedBox(height: 20),

                  Text(
                    "Let’s Get to Know You Better !",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20),

                  // Full Name Field
                  TextFormField(
                    controller: _nameController,
                    validator: _validateName,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Full Name',
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                  ),

                  SizedBox(height: 30),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please select your gender identity",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),

                  SizedBox(height: 12),

                  // Gender Options
                  RadioListTile<String>(
                    title: Text("Male"),
                    value: "Male",
                    groupValue: _gender,
                    onChanged: (value) => setState(() => _gender = value),
                  ),
                  RadioListTile<String>(
                    title: Text("Female"),
                    value: "Female",
                    groupValue: _gender,
                    onChanged: (value) => setState(() => _gender = value),
                  ),
                  RadioListTile<String>(
                    title: Text("Others"),
                    value: "Others",
                    groupValue: _gender,
                    onChanged: (value) => setState(() => _gender = value),
                  ),
                  RadioListTile<String>(
                    title: Text("Prefer not to say"),
                    value: "Prefer not to say",
                    groupValue: _gender,
                    onChanged: (value) => setState(() => _gender = value),
                  ),

                  SizedBox(height: 30),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isFormValid ? _onContinue : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1E66F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
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
        ),
      ),
    );
  }
}
