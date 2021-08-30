import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 20;
const LatLng SOURCE_LOCATION = LatLng(6.465422, 3.406448);
const LatLng DEST_LOCATION = LatLng(6.45407, 3.39467);
const double PIN_INVISIBLE_POSITION = -220;

class DeliveryNearBy extends StatefulWidget {
  DeliveryNearBy({Key? key}) : super(key: key);

  @override
  _DeliveryNearByState createState() => _DeliveryNearByState();
}

class _DeliveryNearByState extends State<DeliveryNearBy> {
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  double pinPillPosition = PIN_VISIBLE_POSITION;
  late LatLng currentLocation;
  late LatLng destinationLocation;
  bool userBadgeSelected = false;

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  @override
  void initState() {
    super.initState();

    polylinePoints = PolylinePoints();

    // set up initial locations
    this.setInitialLocation();
  }

  //  void setSourceAndDestinationMarkerIcons(BuildContext context) async {
  //  // String parentCat = widget.subCategory!.imgName!.split("_")[0];

  //   sourceIcon = await BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration(devicePixelRatio: 2.0),
  //     'assets/imgs/source_pin${Utils.deviceSuffix(context)}.png'
  //   );

  //   destinationIcon = await BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration(devicePixelRatio: 2.0),
  //     'assets/imgs/destination_pin_${parentCat}${Utils.deviceSuffix(context)}.png'
  //   );
  // }

  void setInitialLocation() {
    currentLocation =
        LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);

    destinationLocation =
        LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION);
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: GoogleMap(
                myLocationEnabled: true,
                compassEnabled: false,
                tiltGesturesEnabled: false,
                polylines: _polylines,
                markers: _markers,
                mapType: MapType.normal,
                initialCameraPosition: initialCameraPosition,
                onTap: (LatLng loc) {
                  setState(() {
                    this.pinPillPosition = PIN_INVISIBLE_POSITION;
                    this.userBadgeSelected = false;
                  });
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);

                  showPinsOnMap();
                  setPolylines();
                },
              ),
            ),
            Positioned(
                top: 40,
                left: 40,
                child: backArrow(Navigator.of(context).pop,
                    color: Colors.black, colorIcon: Colors.white)),
            Positioned(
              top: 40,
              right: 40,
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFFACD5D),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.list,
                    ),
                  )),
            ),
            // DraggableScrollableSheet(
            //     maxChildSize: 0.35,
            //     initialChildSize: 0.35,
            //     minChildSize: 0.05,
            //     builder:
            //         (BuildContext context, ScrollController scrollController) {
            //       return Container(
            //           height: double.infinity,
            //           decoration: BoxDecoration(
            //               color: UIData.kbrightColor,
            //               borderRadius: BorderRadius.only(
            //                   topLeft: Radius.circular(20),
            //                   topRight: Radius.circular(20))),
            //           child: Padding(
            //             padding: const EdgeInsets.only(
            //               top: 8.0,
            //               left: 16,
            //             ),
            //             child: ListView(controller: scrollController,
            //                 //  scrollDirection: Axis.vertical,
            //                 children: [
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.center,
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       Container(
            //                         height: 5,
            //                         width: getProportionateScreenWidth(35),
            //                         decoration: BoxDecoration(
            //                           color: Colors.white,
            //                           borderRadius: BorderRadius.circular(10),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                   SizedBox(
            //                     height: getProportionateScreenHeight(20),
            //                   ),
            //                   customTitleText(
            //                     "Delivery near you",
            //                     colors: Colors.white,
            //                   ),
            //                   SizedBox(
            //                     height: getProportionateScreenHeight(10),
            //                   ),
            //                   Container(
            //                       height: getProportionateScreenHeight(160),
            //                       child: ListView.builder(
            //                           itemCount: 9,
            //                           scrollDirection: Axis.horizontal,
            //                           controller: scrollController,
            //                           itemBuilder: (BuildContext context,
            //                                   index) =>
            //                               Container(
            //                                 width: getProportionateScreenWidth(
            //                                     150),
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       right: 10.0),
            //                                   child: Column(
            //                                     children: [
            //                                       Expanded(
            //                                           flex: 3,
            //                                           child: Container(
            //                                             decoration:
            //                                                 BoxDecoration(
            //                                               image: DecorationImage(
            //                                                   fit: BoxFit.cover,
            //                                                   image: AssetImage(
            //                                                       "assets/images/deliverynearby.png")),
            //                                               borderRadius:
            //                                                   BorderRadius
            //                                                       .circular(10),
            //                                             ),
            //                                           )),
            //                                       Expanded(
            //                                           flex: 1,
            //                                           child: Container(
            //                                             child: Padding(
            //                                               padding:
            //                                                   const EdgeInsets
            //                                                           .only(
            //                                                       top: 8.0, bottom: 5.0),
            //                                               child:
            //                                                   IntrinsicHeight(
            //                                                 child: Row(
            //                                                   crossAxisAlignment:
            //                                                       CrossAxisAlignment
            //                                                           .start,
            //                                                   mainAxisAlignment:
            //                                                       MainAxisAlignment
            //                                                           .start,
            //                                                   children: [
            //                                                     Icon(
            //                                                       Icons.star,
            //                                                       color: Colors
            //                                                           .yellow,
            //                                                       size: 18,
            //                                                     ),
            //                                                     SizedBox(
            //                                                       width: 5,
            //                                                     ),
            //                                                     customDescriptionText(
            //                                                         "5.0",
            //                                                         fontSize:
            //                                                             12),
            //                                                     VerticalDivider(
            //                                                       color: Colors
            //                                                           .grey,
            //                                                       thickness: 1,
            //                                                     ),
            //                                                     customDescriptionText(
            //                                                         "3 Mins",
            //                                                         fontSize:
            //                                                             12),
            //                                                     VerticalDivider(
            //                                                       color: Colors
            //                                                           .grey,
            //                                                       thickness: 1,
            //                                                     ),
            //                                                     customDescriptionText(
            //                                                         "NN",
            //                                                         fontSize:
            //                                                             12)
            //                                                   ],
            //                                                 ),
            //                                               ),
            //                                             ),
            //                                           )),
            //                                     ],
            //                                   ),
            //                                 ),
            //                               ))),
            //                 ]),
            //           ));
            //     })
          ],
        ),
      ),
    );
  }

  void showPinsOnMap() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: currentLocation,
          icon: sourceIcon,
          onTap: () {
            setState(() {
              this.userBadgeSelected = true;
            });
          }));

      _markers.add(Marker(
          markerId: MarkerId('destinationPin'),
          position: destinationLocation,
          icon: destinationIcon,
          onTap: () {
            setState(() {
              this.pinPillPosition = PIN_VISIBLE_POSITION;
            });
          }));
    });
  }

  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "<GOOGLE_MAPS_API_KEY_HERE>",
        PointLatLng(currentLocation.latitude, currentLocation.longitude),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude));

    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      setState(() {
        _polylines.add(Polyline(
            width: 10,
            polylineId: PolylineId('polyLine'),
            color: Color(0xFF08A5CB),
            points: polylineCoordinates));
      });
    }
  }
}
