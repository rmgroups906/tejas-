import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ListeningScreen extends StatefulWidget {
  @override
  _ListeningScreenState createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/listening.mp4')
      ..initialize().then((_) {
        setState(() {}); // Refresh to show video
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Close Button
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                SizedBox(height: 10),

                // Title
                Text(
                  'Talk with our',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                Text(
                  'AI model',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 30),

                // Video Player (Listening Animation)
                _controller.value.isInitialized
                    ? SizedBox(
                      height: 120,
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    )
                    : Container(
                      height: 120,
                      child: Center(child: CircularProgressIndicator()),
                    ),

                SizedBox(height: 30),

                // Listening Label
                Text(
                  'Listening',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),

                SizedBox(height: 20),

                // Recognized Speech Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'How should I manage ',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                      children: [
                        TextSpan(
                          text: 'my timetable and be productive.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // Cancel Button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.close, color: Colors.red, size: 32),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
