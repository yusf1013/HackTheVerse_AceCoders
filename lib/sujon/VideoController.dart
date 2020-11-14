import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math' show cos, sqrt, asin;

class VideoController extends StatefulWidget {
  @override
  _VideoControllerState createState() => _VideoControllerState();
}

class _VideoControllerState extends State<VideoController> {

  double latitude1=44.33328, longitude1=-94.420307, latitude2=44.33328, longitude2=-89.132008 ;

  TextEditingController _latTextEditingController = TextEditingController() ;
  TextEditingController _longTextEditingController = TextEditingController() ;

  CameraController controller;
  String videoPath;

  //_VideoControllerState(this.latitude1, this.longitude1, this.latitude2, this.longitude2);

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  List<CameraDescription> cameras;
  int selectedCameraIdx;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    method(latitude1, longitude1, latitude2, longitude2) ;
  }

  void method(double lat1, double long1, double lat2, double long2 ){
    double totalDistance = 0;
    totalDistance = calculateDistance();

    print("------------->>>" + totalDistance.toString());

    if(totalDistance < 500){
      print("---------->>>>>>>GOOG") ;
      availableCameras().then((availableCameras) {
        cameras = availableCameras;

        if (cameras.length > 0) {
          setState(() {
            selectedCameraIdx = 0;
          });

          _onCameraSwitched(cameras[selectedCameraIdx]).then((void v) {
            _onRecordButtonPressed() ;
          });
        }
      })
          .catchError((err) {
        print('Error: $err.code\nError Message: $err.message');
      });
    }
    else {
      _onStopButtonPressed() ;
    }
  }

  double calculateDistance(){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((latitude2 - latitude1) * p)/2 +
        c(latitude1 * p) * c(latitude2 * p) *
            (1 - c((longitude2 - longitude1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

  changeLatLong() async{
    latitude2 = double.parse(_latTextEditingController.text.trim()) ;
    longitude2 = double.parse(_longTextEditingController.text.trim()) ;

    setState(() {
      method(latitude1, longitude1, latitude2, longitude2) ;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Camera example'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("("+latitude1.toString()+", " + longitude1.toString()+")"),
                ),
                SizedBox(width: 30,),
                Expanded(
                  child: TextField(
                    controller: _latTextEditingController,
                    decoration: InputDecoration(),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    controller: _longTextEditingController,
                    decoration: InputDecoration(
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: (){changeLatLong();},
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: _cameraPreviewWidget(),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: controller != null && controller.value.isRecordingVideo
                      ? Colors.redAccent
                      : Colors.grey,
                  width: 3.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //_cameraTogglesRowWidget(),
                _captureControlRowWidget(),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }


  void _onRecordButtonPressed() {
    _startVideoRecording().then((String filePath) {
      if (filePath != null) {
        Fluttertoast.showToast(
            msg: 'Recording video started',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.grey,
            textColor: Colors.white
        );
      }
    });
  }

  void _onStopButtonPressed() {
    _stopVideoRecording().then((_) {
      if (mounted) setState(() {});
      Fluttertoast.showToast(
          msg: 'Video recorded to $videoPath',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.grey,
          textColor: Colors.white
      );
    });
  }

  Future<String> _startVideoRecording() async {
    if (!controller.value.isInitialized) {
      Fluttertoast.showToast(
          msg: 'Please wait',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.grey,
          textColor: Colors.white
      );

      return null;
    }

    // Do nothing if a recording is on progress
    if (controller.value.isRecordingVideo) {
      return null;
    }

    final Directory appDirectory = await getExternalStorageDirectory();
    final String videoDirectory = '${appDirectory.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath = '$videoDirectory/${currentTime}.mp4';

    try {
      await controller.startVideoRecording(filePath);
      videoPath = filePath;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    return filePath;
  }

  Future<void> _stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }


  /// Display the control bar with buttons to record videos.
  Widget _captureControlRowWidget() {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.videocam),
              color: Colors.blue,
              onPressed: controller != null &&
                  controller.value.isInitialized &&
                  !controller.value.isRecordingVideo
                  ? _onRecordButtonPressed
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.stop),
              color: Colors.red,
              onPressed: controller != null &&
                  controller.value.isInitialized &&
                  controller.value.isRecordingVideo
                  ? _onStopButtonPressed
                  : null,
            )
          ],
        ),
      ),
    );
  }


  Future<void> _onCameraSwitched(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        Fluttertoast.showToast(
            msg: 'Camera error ${controller.value.errorDescription}',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white
        );
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);

    Fluttertoast.showToast(
        msg: 'Error: ${e.code}\n${e.description}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white
    );
  }
}
