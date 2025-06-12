import 'package:flutter/material.dart';
import 'upload_question_video_screen.dart';

class McqTestScreen extends StatefulWidget {
  @override
  _McqTestScreenState createState() => _McqTestScreenState();
}

class _McqTestScreenState extends State<McqTestScreen> {
  int selectedOption = -1;
  final List<String> options = ['1', '2', '3', '6'];

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
              // Header row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mathematics Quiz",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.blue),
                      SizedBox(width: 4),
                      Text(
                        "16:35",
                        style: TextStyle(
                          fontSize: width * 0.038,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: height * 0.03),

              // Question number indicator with ring
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        value: 0.6,
                        strokeWidth: 5,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                    Text(
                      "18",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Question Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Quit text
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Quit",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    // Question text
                    Text(
                      "If f(x)=x²−5x+6, which of the following values of x satisfies f(f(x))=0?",
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 20),

                    // Options
                    ...List.generate(options.length, (index) {
                      final isSelected = selectedOption == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = index;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 12),
                          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue : Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            options[index],
                            style: TextStyle(
                              fontSize: width * 0.045,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }),

                    SizedBox(height: 8),

                    // See Result
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "See Result",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: width * 0.04,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, color: Colors.blue),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Spacer(),

              // Bottom Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(14),
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadQuestionVideoScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color(0xFF0066FF),
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.2, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: width * 0.045,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(14),
                    ),
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
