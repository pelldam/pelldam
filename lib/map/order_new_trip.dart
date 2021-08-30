import 'dart:async';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng SOURCE_LOCATION = LatLng(6.49407, 3.89467);
const LatLng DEST_LOCATION = LatLng(6.45407, 3.39467);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 60;
const double PIN_INVISIBLE_POSITION = -260;

class OrderNewTrip extends StatefulWidget {
  static const routeName = "/order_new_trip";

  @override
  State<OrderNewTrip> createState() => _OrderNewTripState();
}

class _OrderNewTripState extends State<OrderNewTrip> {
  Completer<GoogleMapController> _controller = Completer();

  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  double pinPillPosition = PIN_VISIBLE_POSITION;

  late LatLng currentLocation;
  late LatLng destinationLocation;

  @override
  void initState() {
    super.initState();

    //set up initial locations
    this.setInitiallocation();

    //set up the marker
    this.setSourceAndDestinationMarkerIcon();
  }

  void setSourceAndDestinationMarkerIcon() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), "assets/icons/source.png");

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0),
        "assets/icons/destination.png");
  }

  void setInitiallocation() {
    currentLocation = LatLng(
      SOURCE_LOCATION.latitude,
      SOURCE_LOCATION.longitude,
    );

    destinationLocation = LatLng(
      DEST_LOCATION.latitude,
      DEST_LOCATION.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: SOURCE_LOCATION,
    );

    return SafeArea(
      child: Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(225),
        // child: OrdersPage(),
        // ),
        body: Stack(
          children: [
            Positioned.fill(
              child: GoogleMap(
                myLocationEnabled: true,
                compassEnabled: false,
                tiltGesturesEnabled: false,
                markers: _markers,
                mapType: MapType.normal,
                initialCameraPosition: initialCameraPosition,
                onTap: (LatLng loc) {
                  setState(() {
                    this.pinPillPosition = PIN_INVISIBLE_POSITION;
                  });
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);

                  showPinOnMap();
                },
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              left: 0,
              right: 0,
              bottom: this.pinPillPosition,
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 340,
                          height: 190,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: Offset.zero,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      child: Image.asset(
                                        "assets/logos/foodgital_logo.png",
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                            10,
                                            0,
                                            10,
                                            0,
                                          ),
                                          child: Text(
                                            "Marvis Ighedosa",
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                  // color: AppColors.secondary,
                                                  fontFamily: "SofiaPro",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                            40,
                                            0,
                                            0,
                                            0,
                                          ),
                                          child: Text(
                                            "Decline",
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                  // color: AppColors.primarycolor,
                                                  fontFamily: "SofiaPro",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                            70,
                                            0,
                                            0,
                                            0,
                                          ),
                                          child: Text(
                                            "2:pm , 15 may 2020",
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                  // color: AppColors.grayColor,
                                                  fontFamily: "SofiaPro",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                            30,
                                            0,
                                            0,
                                            0,
                                          ),
                                          child: Text(
                                            "Cash on Delivery",
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                  //  color: AppColors.grayColor,
                                                  fontFamily: "SofiaPro",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  50,
                                  0,
                                  36,
                                  0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 54,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.5,
                                          //   color: AppColors.primarycolor
                                          //      .withOpacity(0.2),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Call",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                //color: AppColors.primarycolor,
                                                fontFamily: "SofiaPro",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.5,
                                          //   color: AppColors.primarycolor
                                          //     .withOpacity(0.2),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Message",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                //  color: AppColors.primarycolor,
                                                fontFamily: "SofiaPro",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 70,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.5,
                                          // color: AppColors.primarycolor
                                          //     .withOpacity(0.2),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                //color: AppColors.primarycolor,
                                                fontFamily: "SofiaPro",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    //  color: AppColors.primarycolor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset.zero,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Arrive",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                            //  color: AppColors.white,
                                            fontFamily: "SofiaPro",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   left: 0,
            //   right: 0,
            //   bottom: 0,
            //   child: CustomNavBar(),
            // ),
          ],
        ),
      ),
    );
  }

  void showPinOnMap() {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("source"),
            position: currentLocation,
            icon: sourceIcon),
      );

      _markers.add(
        Marker(
            markerId: MarkerId("destination"),
            position: destinationLocation,
            icon: destinationIcon,
            onTap: () {
              setState(() {
                this.pinPillPosition = PIN_VISIBLE_POSITION;
              });
            }),
      );
    });
  }
}

class Utils {
  static String mapStyle = """
  [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]
  """;
}
