import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<List<CameraDescription>> getCameras() async {
  WidgetsFlutterBinding.ensureInitialized();
  return await availableCameras();
}

class FoodTracking extends StatefulWidget {
  @override
  _FoodTrackingState createState() => _FoodTrackingState();
}

class _FoodTrackingState extends State<FoodTracking> {
  late Future<CameraController> controllerFuture;

  @override
  void initState() {
    super.initState();
    controllerFuture = setupCamera();
  }

  Future<CameraController> setupCamera() async {
    final cameras = await getCameras();
    final controller = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    await controller.initialize();
    return controller;
  }

  @override
  void dispose() async {
    final controller = await controllerFuture;
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<CameraController>(
        future: controllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final controller = snapshot.data!;
          return CameraPreview(controller);
        },
      ),
    );
  }
}
