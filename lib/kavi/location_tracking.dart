import 'package:flutter/material.dart';

class LocationTracking extends StatefulWidget {
  @override
  _LocationTrackingState createState() => _LocationTrackingState();
}

class _LocationTrackingState extends State<LocationTracking> {
  double width = 100.0, height = 100.0;
  Offset position ;

  @override
  void initState() {
    super.initState();
    position = Offset(0.0, height - 20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Location Tracking",
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: position.dx,
            top: position.dy - height + 20,
            child: Draggable(
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width/2),
                  color: Colors.blue,
                ),
                child: Center(child: Text("Drag", style: Theme.of(context).textTheme.headline,),),
              ),
              feedback: Container(
                child: Center(
                  child: Text("Drag", style: Theme.of(context).textTheme.headline,),),
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width/2),
                  color: Colors.red[800],
                ),
              ),
              onDraggableCanceled: (Velocity velocity, Offset offset){
                setState(() => position = offset);
              },
            ),
          ),
        ],
      ),
    );
  }
}
