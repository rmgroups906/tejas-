import 'package:flutter/material.dart';
import 'arts_screen.dart';
import 'commerce_screen.dart';
import 'science_screen.dart';
import 'others_screen.dart';

class StudentStreamSelectionScreen extends StatefulWidget {
  @override
  _StudentStreamSelectionScreenState createState() => _StudentStreamSelectionScreenState();
}

class _StudentStreamSelectionScreenState extends State<StudentStreamSelectionScreen> {
  final List<String> _streams = ['Science', 'Commerce', 'Arts', 'others'];
  String? _selectedStream;

  void _onContinue() {
  Widget nextScreen;

  switch (_selectedStream) {
    case 'Science':
      nextScreen = ScienceScreen();
      break;
    case 'Commerce':
      nextScreen = CommerceScreen();
      break;
    case 'Arts':
      nextScreen = ArtsScreen();
      break;
    default:
      nextScreen = OthersScreen();
  }

  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => nextScreen),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Arrow
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, size: 28),
              ),
              SizedBox(height: 20),

              Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Image.asset(
      'assets/hat.jpg',
      height: 36,
    ),
  ],
),


              // Title and Subtitle
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Your Academic Stream\nto Personalize Your Learning Journey",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "This helps us tailor the right content,\nmentors, and guidance just for you.",
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  // Cap icon (you can replace this with an Image.asset or Icon if needed
                ],
              ),

              SizedBox(height: 40),

              // Dropdown
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: DropdownButtonFormField<String>(
                  value: _selectedStream,
                  hint: Text("Select Academic Stream"),
                  icon: Icon(Icons.keyboard_arrow_down),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  items: _streams.map((stream) {
                    return DropdownMenuItem<String>(
                      value: stream,
                      child: Text(stream),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedStream = value;
                    });
                  },
                ),
              ),

              Spacer(),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _selectedStream != null ? _onContinue : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0052CC),
                    disabledBackgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
