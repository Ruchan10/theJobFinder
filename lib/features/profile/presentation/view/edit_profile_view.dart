import 'dart:io';

import 'package:file_case/file_case.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UpdateProfile extends ConsumerStatefulWidget {
  const UpdateProfile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends ConsumerState<UpdateProfile> {
  final FileCaseController firstController = FileCaseController(
      filePickerOptions:
          FilePickerOptions(type: FileType.any, allowMultiple: true),
      tag: 'controller1');
  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  File? _img;
  Future _browseImage(WidgetRef ref, ImageSource imageSource) async {
    checkCameraPermission();
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  File? _cv;
  String? _selectedFileName;

  Future _browseCv() async {
    final permissionStatus = await Permission.storage.status;
    print(permissionStatus);
    if (permissionStatus.isDenied) {
      // Here just ask for the permission for the first time
      await Permission.storage.request();
      print("DENIED");

      // I noticed that sometimes popup won't show after user press deny
      // so I do the check once again but now go straight to appSettings
      if (permissionStatus.isDenied) {
        await openAppSettings();
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      // Here open app settings for user to manually enable permission in case
      // where permission was permanently denied
      print("PERMANANTLY DENIED");
      await openAppSettings();
    } else {
      try {
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
        );
        if (result != null && result.files.isNotEmpty) {
          setState(() {
            _cv = File(result.files.first.path!);
            _selectedFileName = result.files.first.name;
          });
        } else {
          // User canceled the file picking process or no files were selected.
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Spacer(),
                  const Text(
                    "Update Profile",
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.grey[300],
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              _browseImage(ref, ImageSource.camera);
                              Navigator.pop(context);
                              // Upload image it is not null
                            },
                            icon: const Icon(Icons.camera),
                            label: const Text('Camera'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              _browseImage(ref, ImageSource.gallery);
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.image),
                            label: const Text('Gallery'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _img != null
                        ? FileImage(_img!)
                        : const AssetImage('') as ImageProvider,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: height * .07,
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 20), // add padding to adjust text
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    labelText: "Full Name",
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 1), // add padding to adjust icon
                      child: Icon(Icons.text_fields),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: height * .07,
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 20), // add padding to adjust text
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    labelText: "Phone Number",
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.only(top: 1), // add padding to adjust icon
                      child: Icon(Icons.phone),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 70),
                  const Text(
                    " CV   ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _browseCv();
                    },
                    child: Container(
                      height: 70,
                      width: width * 0.3,
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.edit_document, color: Colors.white),
                          Text(_selectedFileName ?? 'Upload Here',
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
