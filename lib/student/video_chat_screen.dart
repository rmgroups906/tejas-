import 'dart:async';

import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoCallScreen extends StatefulWidget {
  final String channelName;
  final String appId;
  const VideoCallScreen({
    super.key,
    required this.channelName,
    required this.appId,
  });

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late final RtcEngine _engine;
  bool muted = false;
  bool videoMuted = false;
  bool frontCamera = true;

  Timer? _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    await [Permission.camera, Permission.microphone].request();

    _engine = createAgoraRtcEngine();
    await _engine.initialize(RtcEngineContext(appId: widget.appId));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (connection, elapsed) {
          setState(() {
            _localUserJoined = true;
          });
          startTimer();
        },
        onUserJoined: (connection, remoteUid, elapsed) {
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (connection, remoteUid, reason) {
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: "",
      channelId: widget.channelName,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  String get timerText {
    final minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _engine.leaveChannel();
    _engine.release();
    super.dispose();
  }

  Widget _renderLocalPreview() {
    if (!_localUserJoined) {
      return const Center(
        child: Text(
          'Joining channel...',
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    if (videoMuted) {
      return const Center(
        child: Icon(Icons.videocam_off, color: Colors.white54, size: 64),
      );
    }
    return AgoraVideoView(
      controller: VideoViewController(
        rtcEngine: _engine,
        canvas: const VideoCanvas(uid: 0),
      ),
    );
  }

  Widget _renderRemoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(channelId: widget.channelName),
        ),
      );
    } else {
      return const Center(
        child: Text(
          'Waiting for tutor to join...',
          style: TextStyle(color: Colors.white54),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Remote video full screen
          Positioned.fill(child: _renderRemoteVideo()),

          // Call timer at top center
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  timerText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),

          // Small local preview on top right
          Positioned(
            top: 80,
            right: 16,
            width: 120,
            height: 160,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.black54,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _renderLocalPreview(),
              ),
            ),
          ),

          // Control buttons at bottom center
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Mute mic
                FloatingActionButton(
                  heroTag: 'mute_audio',
                  backgroundColor: muted ? Colors.red : Colors.white,
                  child: Icon(
                    muted ? Icons.mic_off : Icons.mic,
                    color: muted ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      muted = !muted;
                    });
                    _engine.muteLocalAudioStream(muted);
                  },
                ),

                // Mute video
                FloatingActionButton(
                  heroTag: 'mute_video',
                  backgroundColor: videoMuted ? Colors.red : Colors.white,
                  child: Icon(
                    videoMuted ? Icons.videocam_off : Icons.videocam,
                    color: videoMuted ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      videoMuted = !videoMuted;
                    });
                    _engine.muteLocalVideoStream(videoMuted);
                  },
                ),

                // End call
                FloatingActionButton(
                  heroTag: 'end_call',
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.call_end, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                // Switch camera
                FloatingActionButton(
                  heroTag: 'switch_camera',
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.switch_camera, color: Colors.black),
                  onPressed: () {
                    _engine.switchCamera();
                    setState(() {
                      frontCamera = !frontCamera;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
