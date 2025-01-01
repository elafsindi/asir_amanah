import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:math' as math;

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController _mapController;
  LatLng _currentPosition = const LatLng(18.216667, 42.505278);
  bool _isMapReady = false;
  bool _isOutsideArea = false;
  String _message = '';

  final LatLng _centerOfAsir = LatLng(18.216667, 42.505278);
  final double _radius = 0.1;

  Marker? _draggableMarker;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    Location location = Location();

    try {
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) return;
      }

      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) return;
      }

      LocationData locationData = await location.getLocation();
      final userLocation = LatLng(
        locationData.latitude ?? _currentPosition.latitude,
        locationData.longitude ?? _currentPosition.longitude,
      );

      setState(() {
        _currentPosition = userLocation;
        _checkIfOutsideAsir(userLocation);
        _draggableMarker = Marker(
          markerId: MarkerId('draggable_marker'),
          position: _currentPosition,
          draggable: true,
          onDragEnd: (newPosition) {
            setState(() {
              _draggableMarker = _draggableMarker?.copyWith(
                positionParam: newPosition,
              );
            });
          },
        );
      });

      if (_isMapReady) {
        _mapController.animateCamera(
          CameraUpdate.newLatLng(userLocation),
        );
      }
    } catch (e) {
      print("خطأ أثناء الحصول على الموقع: $e");
    }
  }

  void _checkIfOutsideAsir(LatLng userLocation) {
    double distance = _calculateDistance(
      _centerOfAsir.latitude,
      _centerOfAsir.longitude,
      userLocation.latitude,
      userLocation.longitude,
    );

    if (distance > _radius) {
      setState(() {
        _isOutsideArea = true;
        _message = 'أنت خارج منطقة عسير';
      });
    } else {
      setState(() {
        _isOutsideArea = false;
        _message = 'أنت داخل منطقة عسير';
      });
    }
  }

  double _calculateDistance(
    double lat1, double lon1, double lat2, double lon2) {
    const double radius = 6371;
    double dLat = _degToRad(lat2 - lat1);
    double dLon = _degToRad(lon2 - lon1);
    double a = 
        (math.sin(dLat / 2) * math.sin(dLat / 2)) +
        math.cos(_degToRad(lat1)) * math.cos(_degToRad(lat2)) *
        (math.sin(dLon / 2) * math.sin(dLon / 2));
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    double distance = radius * c;
    return distance;
  }

  double _degToRad(double deg) {
    return deg * (math.pi / 180);
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _isMapReady = true;
    _setMapStyle();
  }

  Future<void> _setMapStyle() async {
    String darkMapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_styles/dark_map.json');
    _mapController.setMapStyle(darkMapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: _currentPosition,
            zoom: 14.4746,
          ),
          myLocationEnabled: true,
            myLocationButtonEnabled: false,

          zoomControlsEnabled: false,
          markers: _draggableMarker != null ? Set.of([_draggableMarker!]) : Set(),
          onMapCreated: _onMapCreated,
          onTap: (LatLng tappedPoint) {
            setState(() {
              _draggableMarker = Marker(
                markerId: MarkerId('draggable_marker'),
                position: tappedPoint,
                draggable: true,
                onDragEnd: (newPosition) {
                  setState(() {
                    _draggableMarker = _draggableMarker?.copyWith(
                      positionParam: newPosition,
                    );
                  });
                },
              );
            });
          },
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.17,
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: _isOutsideArea
                ? Text(
                    _message,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                : Text(
                    "يرجى تحديد الموقع للبلاغ",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
          ),
        ),
      ],
    );
  }
}
