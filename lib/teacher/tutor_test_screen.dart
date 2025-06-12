import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'mcq_test_screen.dart';

class TutorTestScreen extends StatefulWidget {
  @override
  _TutorTestScreenState createState() => _TutorTestScreenState();
}

class _TutorTestScreenState extends State<TutorTestScreen> {
  File? introVideo;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        introVideo = File(pickedFile.path);
      });
    }
  }

  Widget _buildUploadBox() {
    return GestureDetector(
      onTap: _pickVideo,
      child: DottedBorder(
        color: Colors.grey,
        strokeWidth: 1,
        borderType: BorderType.RRect,
        radius: Radius.circular(8),
        dashPattern: [6, 3],
        child: Container(
          width: double.infinity,
          height: 130,
          alignment: Alignment.center,
          child:
              introVideo == null
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload_file_rounded,
                        size: 32,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Click to Upload",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "(Max. File size: 25 MB)",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  )
                  : Text(
                    "Video Selected ✅",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
        ),
      ),
    );
  }

  void _onContinue() {
    if (introVideo == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please upload your introduction video before continuing.',
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => McqTestScreen()),
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
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.015),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),

              SizedBox(height: height * 0.025),
              Text(
                "You will now be tested for the\nTejas Tutor Test",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.05,
                ),
              ),
              SizedBox(height: height * 0.035),
              Text(
                "Upload Self Introduction Video (max 1 min)",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              _buildUploadBox(),
              SizedBox(height: height * 0.04),
              Text(
                "Upon clicking 'Continue,' your MCQ test will begin, consisting of 10 questions for each subject you selected. You are requested to record a video of yourself solving the questions, which you will be asked to upload later.",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13.5),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0066FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
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
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
