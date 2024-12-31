import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  late GoogleMapController mapController;
  late Future<LocationData> _locationDataFuture;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _locationDataFuture = _requestLocationPermission();
  }

  Future<LocationData> _requestLocationPermission() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // تأكد من أن خدمة الموقع مفعلّة
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        throw Exception("الموقع غير مفعل");
      }
    }

    // تحقق من صلاحية الوصول إلى الموقع
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        throw Exception("صلاحية الوصول إلى الموقع غير مُعطاة");
      }
    }

    // إذا كانت الصلاحيات مُعطاة، احصل على بيانات الموقع
    return await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Maps Example")),
      body: FutureBuilder<LocationData>(
        future: _locationDataFuture, // الانتظار لحين جلب الموقع
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final locationData = snapshot.data!;
            return GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(locationData.latitude ?? 37.42796133580664,
                    locationData.longitude ?? -122.085749655962),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            );
          } else {
            return const Center(child: Text('No location data available'));
          }
        },
      ),
    );
  }
}
