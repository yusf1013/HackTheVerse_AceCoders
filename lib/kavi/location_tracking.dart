import 'package:ecommerce/kavi/qr_scanner.dart';
import 'package:flutter/material.dart';

class LocationTracking extends StatefulWidget {
  @override
  _LocationTrackingState createState() => _LocationTrackingState();
}

class _LocationTrackingState extends State<LocationTracking> {
  double width = 40.0, height = 40.0;
  //double width = 100, height = 100;
  Offset position;

  List<Location> locations = [];
  Location lastLocation;

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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/map2.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Report",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () async {
                      bool check = await Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) => Scanner()));

                      if (check) {
                        setState(() {
                          lastLocation = Location(
                            position: position,
                          );
                          locations.add(lastLocation);
                          print("Shit is shit ${locations.length}");
                        });
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          // locations.isNotEmpty ? locations : Container(),
          ...locations,
          Positioned(
            left: position.dx,
            top: position.dy - height + 20,
            child: Draggable(
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width / 2),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Container(

                  )
                ),
              ),
              feedback: Container(
                child: Center(
                  child: Container(

                  )
                ),
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width / 2),
                  color: Colors.red[800],
                ),
              ),
              onDraggableCanceled: (Velocity velocity, Offset offset) {
                setState(() => position = Offset(offset.dx, offset.dy - 55));
                print(offset);
              },
            ),
          ),
        ],
      ),
    );
  }
}
//

class Location extends StatelessWidget {
  final Offset position;

  Location({this.position});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx + 8,
      top: position.dy - 20,
      /*child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.green,
        ),
        child: Center(
          child: Text(
            "",
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ),*/
      child: Icon(Icons.location_on),
    );
  }
}
