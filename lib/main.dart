import 'package:flutter/material.dart';
import 'package:tejas/screens/SignUp.dart';
import 'package:tejas/screens/LoginFormScreen.dart';
import 'package:tejas/screens/OtpScreen.dart';
import 'package:tejas/screens/VerificationScreen.dart';
import 'package:tejas/screens/NameGenderScreen.dart';
import 'package:tejas/screens/role_selection_screen.dart';
import 'package:tejas/student/language_selection_screen.dart';
import 'package:tejas/student/academic_level_screen.dart';
import 'package:tejas/teacher/language_selection_screen.dart';
import 'package:tejas/student/student_stream_selection_screen.dart';
void main() {
  runApp(TejasApp());
}

class TejasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tejas App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/signup':(context) => SignUp(),
        '/login':(context)=>LoginFormScreen(),
        '/otp': (context) => OtpScreen(),
        '/verification': (context) => VerificationScreen(),
        '/namegender':(context) => NameGenderScreen(),
        '/roleselection':(context)=> RoleSelectionScreen(),
        'student/language':(context) => LanguageSelectionScreen(),
        'student/academic':(context) => AcademicLevelScreen(),
        'student/stream':(context)=> StudentStreamSelectionScreen(),
        'teacher/language':(context)=> TeacherLanguageSelectionScreen(),

      },
    );
  }
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB3E0FF), // light blue
              Color(0xFF0099FF), // deeper blue
            ],
          ),
        ),
       child: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Logo Image
      Image.asset(
        'assets/logo.png',
        height: height * 0.2, // reduced from 0.25 for better visual balance
      ),
      const SizedBox(height: 30),

      // TEJAS Text
      const Text(
        "TEJAS",
        style: TextStyle(
          fontFamily: 'Poppins', // Update to your actual font if different
          fontWeight: FontWeight.w700,
          fontSize: 36,
          color: Color(0xFF003366),
          letterSpacing: 1.2,
        ),
      ),

      // Learning Text
      const Text(
        "Learning",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Color(0xFF003366),
        ),
      ),
    ],
  ),
),

      ),
    );
  }
}
class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/onboarding1.jpg',
      'title': 'One-on-One Doubt Solving',
      'subtitle':
          'Personalized learning experiences designed to clear your concepts faster.',
    },
    {
      'image': 'assets/onboarding2.jpg',
      'title': 'Instant Learning Assistance',
      'subtitle':
          'Get connected with expert tutors in seconds, anytime you’re stuck.',
    },
    {
      'image': 'assets/onboarding3.jpg',
      'title': 'Boost Your Exam Preparation Today',
      'subtitle':
          'Practice daily, track progress, and stay ahead in every subject with Tejas.',
    },
  ];

  void _nextPage() {
    if (_currentPage == onboardingData.length - 1) {
      Navigator.pushReplacementNamed(context, '/signup');
    } else {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    Navigator.pushReplacementNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Image.asset(
                onboardingData[index]['image']!,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  onboardingData[index]['title']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  onboardingData[index]['subtitle']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  TextButton(
                    onPressed: _skip,
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: _nextPage,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0052CC),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}
