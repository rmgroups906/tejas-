import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  XFile? _capturedImage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras![0],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _cameraController!.initialize();
    if (mounted) {
      setState(() => _isCameraInitialized = true);
    }
  }

  Future<void> _takePicture() async {
    if (!_cameraController!.value.isInitialized) return;

    final XFile image = await _cameraController!.takePicture();
    setState(() {
      _capturedImage = image;
    });
  }

  void _confirmPhotoAndGoBack() {
    Navigator.pop(context); // optionally pass image path here
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Take Photo"),
      ),
      body:
          _isCameraInitialized
              ? Stack(
                children: [
                  _capturedImage == null
                      ? CameraPreview(_cameraController!)
                      : SizedBox.expand(
                        child: Image.file(
                          File(_capturedImage!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                  if (_capturedImage == null)
                    Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera,
                            size: 40,
                            color: Colors.white,
                          ),
                          onPressed: _takePicture,
                        ),
                      ),
                    ),
                  if (_capturedImage != null)
                    Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.green,
                            onPressed: _confirmPhotoAndGoBack,
                            child: const Icon(Icons.check),
                          ),
                        ],
                      ),
                    ),
                ],
              )
              : const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
    );
  }
}
