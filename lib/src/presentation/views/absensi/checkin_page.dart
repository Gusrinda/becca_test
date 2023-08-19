import 'dart:async';
import 'dart:io';

import 'package:becca_sales/src/core/utils/formatter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';

class CheckInPage extends StatefulWidget {
  static const String routeName = "/checkin_page";

  final String fromWhere;

  const CheckInPage({super.key, required this.fromWhere});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  final _picker = ImagePicker();
  XFile? pickedFile;

  Position? _currentPosition;
  String _currentAddress = "";

  Future<void> _getLocation() async {
    EasyLoading.show(status: "Mengambil lokasi . . .");

    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationServiceEnabled) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Handle permission denied scenario
          EasyLoading.dismiss();
          EasyLoading.showError("LocationPermission denied!");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Handle the scenario when location permission is permanently denied
        EasyLoading.dismiss();
        EasyLoading.showError("LocationPermission denied!");
        return;
      }

      // Get the current position (latitude and longitude)
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
        EasyLoading.dismiss();
        EasyLoading.showSuccess("Lokasi berhasil diambil.");
      });

      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks != null && placemarks.isNotEmpty) {
          Placemark placemark = placemarks[0];
          String address =
              "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
          setState(() {
            _currentAddress = address;
          });
        }
      } catch (e) {
        print("Error: $e");
      }
    } else {
      // Handle the scenario when location service is not enabled
      EasyLoading.dismiss();
      EasyLoading.showError("location service is not enabled!");
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _getLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Check In ${widget.fromWhere}"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                pickMetode("Camera");
              },
              child: Container(
                height: 230,
                decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(10)),
                child: pickedFile == null
                    ? Center(
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: [10, 4],
                          color: Colors.grey,
                          radius: Radius.circular(10),
                          padding: EdgeInsets.all(6),
                          child: Icon(
                            Icons.add_rounded,
                            color: Colors.grey,
                            size: 48,
                          ),
                        ),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(pickedFile!.path),
                              )),
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26.withOpacity(0.1),
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                              color: Color(0xFFDEDEDE),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              )),
                          child: Center(
                              child: Text(
                            "Tanggal",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 10),
                            child: Text(
                              kFormatTanggalAbsen.format(DateTime.now()),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26.withOpacity(0.1),
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                              color: Color(0xFFDEDEDE),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              )),
                          child: Center(
                              child: Text(
                            "Waktu",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 10),
                            child: Text(
                              kTimeSecondFormat.format(DateTime.now()),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26.withOpacity(0.1),
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                        color: Color(0xFFDEDEDE),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        )),
                    child: Center(
                        child: Text(
                      "Lokasi",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      child: Text(
                        '${_currentAddress}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26.withOpacity(0.1),
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                              color: Color(0xFFDEDEDE),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              )),
                          child: Center(
                              child: Text(
                            "Lattitude",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 10),
                            child: Text(
                              '${_currentPosition == null ? '-' : _currentPosition!.latitude}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26.withOpacity(0.1),
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                              color: Color(0xFFDEDEDE),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              )),
                          child: Center(
                              child: Text(
                            "Longitude",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 10),
                            child: Text(
                              '${_currentPosition == null ? '-' : _currentPosition!.longitude}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.fromLTRB(30, 0, 30, 28),
          child: ElevatedButton(
            onPressed: () async {
              final isYes = await handleFormSubmit(context);

              if (isYes != null) {
                if (isYes) {
                  EasyLoading.show(status: "Loading . . .");

                  Timer(
                      // ignore: prefer_const_constructors
                      const Duration(seconds: 2), () async {
                    EasyLoading.dismiss();
                    handleFormSuccess(context);
                    Timer(
                        // ignore: prefer_const_constructors
                        const Duration(seconds: 1), () async {
                      Navigator.pop(context);
                      Navigator.pop(context, true);
                    });
                  });
                }
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    pickedFile == null ? Colors.grey : Color(0xFF00D422),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Check In",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )),
    );
  }

  Future pickMetode(String metode) async {
    try {
      final pickFile = await _picker.pickImage(
          source:
              metode == "Camera" ? ImageSource.camera : ImageSource.gallery);

      if (pickFile == null) return;
      setState(() => this.pickedFile = pickFile);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<bool?> handleFormSubmit(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
            constraints: const BoxConstraints(minWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage(Assets.images.confirmation.path)),
                const SizedBox(height: 16),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Apakah anda yakin?",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: themeFontDefault),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, false),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          backgroundColor: ThemeColors.neutral4,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: themeFontDefault),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeBlue,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text('Yes',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<bool?> handleFormSuccess(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
            constraints: const BoxConstraints(minWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Checkin Berhasil !",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 48,
                ),
                Image.asset(Assets.images.successConfirm.path),
                const SizedBox(
                  height: 48,
                ),
                Text(
                  "Data berhasil disimpan !",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
