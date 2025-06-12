import 'package:flutter/material.dart';
import 'terms_condition_screen.dart';

class AvailabilityCheckScreen extends StatefulWidget {
  @override
  _AvailabilityCheckScreenState createState() => _AvailabilityCheckScreenState();
}

class _AvailabilityCheckScreenState extends State<AvailabilityCheckScreen> {
  List<String> selectedDays = [];
  String? selectedSlot;

  final List<String> allDays = [
    'SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY'
  ];

  final List<String> sessionSlots = [
    '9:00 AM - 10:00 AM',
    '10:00 AM - 11:00 AM',
    '2:00 PM - 3:00 PM',
    '4:00 PM - 5:00 PM',
  ];

  void toggleDay(String day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
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
              // Back arrow
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),

              SizedBox(height: height * 0.01),

              // Title
              Text(
                "Kindly let us know your availability",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.05,
                ),
              ),

              SizedBox(height: height * 0.01),

              // Subtitle
              Text(
                "Include your preferred days and times so we can schedule accordingly",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: width * 0.038,
                ),
              ),

              SizedBox(height: height * 0.04),

              // Availability Label
              Text(
                "Select the days that suit your availability",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: width * 0.037,
                ),
              ),

              SizedBox(height: 10),

              // Filter by + days box
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Filter Header Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Filter by ",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.038,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.green.shade900,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.white, size: 14),
                                  SizedBox(width: 4),
                                  Text(
                                    "Week Days",
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.close, color: Colors.grey),
                      ],
                    ),

                    SizedBox(height: 16),

                    // Day buttons
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: allDays.map((day) {
                        final isSelected = selectedDays.contains(day);
                        return GestureDetector(
                          onTap: () => toggleDay(day),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? const Color.fromARGB(255, 0, 44, 3) : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: Text(
                              day,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.04),

              // Time Slot Label
              Text(
                "Choose the time slot that work best for you",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: width * 0.037,
                ),
              ),

              SizedBox(height: 12),

              // Dropdown for session slot
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text("Select Session Slot"),
                    value: selectedSlot,
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    onChanged: (value) {
                      setState(() {
                        selectedSlot = value;
                      });
                    },
                    items: sessionSlots.map((slot) {
                      return DropdownMenuItem<String>(
                        value: slot,
                        child: Text(slot),
                      );
                    }).toList(),
                  ),
                ),
              ),

              Spacer(),

              // Continue button
              SizedBox(
                width: double.infinity,
                height: height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TermsConditionsScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
