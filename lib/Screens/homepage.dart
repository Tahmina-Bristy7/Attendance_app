import 'package:attendance/Widgetes/buttonWidget.dart';
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
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topRight: Radius.circular(80)),
          child: Container(
            height: MediaQuery.of(context).size.height / 1.4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    //bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(80))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Card(
                    elevation: 25,
                    child: Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: _image == null
                          ? Image.asset(
                              'assets/images/demo .jpg',
                              fit: BoxFit.cover,
                            )
                          : Image.file(_image!, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const SizedBox(height: 10),
                  BuildButton(
                    inputColor: Colors.blueGrey,
                    sizeWidth: MediaQuery.of(context).size.width / 1.8,
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
                  const SizedBox(height: 25),
                  BuildButton(
                    inputColor: Colors.teal,
                    onClick: () {},
                    sizeWidth: MediaQuery.of(context).size.width / 2.5,
                    icon: Icons.arrow_circle_right,
                    title: 'Submit',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
