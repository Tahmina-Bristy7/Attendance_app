import 'package:attendance/Widgetes/buttonWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  final imagePicker = ImagePicker();
  String location = 'Press Button';
  String Address = 'search';

  Future getimage() async {
    // ignore: deprecated_member_use
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<Position> _getGeoLocationPosition() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return Future.error('Location services are disabled.');
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }

    Future<void> GetAddressFromLatLong(Position position) async {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      print(placemarks);
      Placemark place = placemarks[0];

      setState(() {
        Address =
            '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      });
    }

    @override
    void initState() async {
      Position position = await _getGeoLocationPosition();
      _getGeoLocationPosition();
      GetAddressFromLatLong(position);
    }

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        height: MediaQuery.of(context).size.height / 1.2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: _image == null
                    ? const Icon(
                        Icons.person_add,
                        size: 80,
                      )
                    : Image.file(_image!, fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              // Text(
              //   'Address: ${Address}',
              //   style: const TextStyle(fontSize: 20),
              // ),
              const SizedBox(height: 10),
              BuildButton(
                onClick: () {
                  getimage();
                },
                icon: Icons.camera_alt_outlined,
                title: 'Take a Picture',
              ),
              // BuildButton(
              //   onClick: () async {
              //     Position position = await _getGeoLocationPosition();
              //     GetAddressFromLatLong(position);
              //     setState(() {
              //       location =
              //           'Latitude: ${position.latitude} , Longitude: ${position.longitude}';
              //     });
              //     // print(location);
              //   },
              //   icon: Icons.add_location_alt_outlined,
              //   title: 'Get Location',
              // ),
              const SizedBox(height: 20),
              BuildButton(
                onClick: () {},
                icon: Icons.arrow_circle_right,
                title: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
