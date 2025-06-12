import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'availability_check_screen.dart';

class UploadQuestionVideoScreen extends StatefulWidget {
  @override
  _UploadQuestionVideoScreenState createState() =>
      _UploadQuestionVideoScreenState();
}

class _UploadQuestionVideoScreenState extends State<UploadQuestionVideoScreen> {
  String? fileName;

  Future<void> _pickVideoFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      withData: true,
    );

    if (result != null && result.files.first.size <= 25 * 1024 * 1024) {
      setState(() {
        fileName = result.files.first.name;
      });
    } else if (result != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('File must be less than 25 MB')));
    }
  }

  void _onContinuePressed() {
    if (fileName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please upload a video before continuing.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AvailabilityCheckScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),

              SizedBox(height: height * 0.01),

              // Heading
              Text(
                "Please upload the video of your question-solving process as requested",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.05,
                ),
              ),

              SizedBox(height: height * 0.03),

              // Upload Box with Dotted Border
              GestureDetector(
                onTap: _pickVideoFile,
                child: DottedBorder(
                  color: Colors.grey.shade400,
                  strokeWidth: 2,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  dashPattern: [6, 4],
                  child: Container(
                    width: double.infinity,
                    height: height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_rounded,
                          size: width * 0.12,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(height: 8),
                        Text(
                          fileName ?? "Click to Upload",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "(Max. File size: 25 MB)",
                          style: TextStyle(
                            fontSize: width * 0.035,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.05),

              // Illustration Image (replace with your asset)
              Center(
                child: Image.asset(
                  'assets/video_upload_illustration.jpg',
                  height: height * 0.28,
                  fit: BoxFit.contain,
                ),
              ),

              Spacer(),

              // Continue Button
              Center(
                child: ElevatedButton(
                  onPressed: _onContinuePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    minimumSize: Size(double.infinity, height * 0.07),
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

              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
