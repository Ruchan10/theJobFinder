import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:the_job_finder/features/profile/presentation/viewmodel/profile_view_model.dart';

import '../../domain/entity/profile_entity.dart';

class UpdateProfile extends ConsumerStatefulWidget {
  const UpdateProfile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateProfileState();
}

List<ProfileEntity> profile = [];

String? _userName;
const String apiBaseUrl = 'http://192.168.1.6:3000/';
String? _phoneNum;

class _UpdateProfileState extends ConsumerState<UpdateProfile> {
  final _fullNameController = TextEditingController(text: "Ruchan Kayastha");
  final _phoneNumController = TextEditingController(text: "9800000000");

  // final FileCaseController firstController = FileCaseController(
  //     filePickerOptions:
  //         FilePickerOptions(type: FileType.any, allowMultiple: true),
  //     tag: 'controller1');
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
    if (permissionStatus.isDenied) {
      // Here just ask for the permission for the first time
      await Permission.storage.request();
      // I noticed that sometimes popup won't show after user press deny
      // so I do the check once again but now go straight to appSettings
      if (permissionStatus.isDenied) {
        await openAppSettings();
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      // Here open app settings for user to manually enable permission in case
      // where permission was permanently denied
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

  void _updateProfileData() {
    final fullName = _fullNameController.text;
    final phoneNumber = _phoneNumController.text;
    // Make sure you have the profile picture and CV file selected before proceeding.
    if (_img == null || _cv == null) {
      // Show an error message or take appropriate action if the user hasn't selected the required files.
      return;
    }

    // Create a ProfileEntity object with the gathered data.
    final profile = ProfileEntity(
      profile: _img!.path,
      fullName: fullName,
      phoneNumber: phoneNumber,
      cv: _cv!.path,
    );

    // Call the updateProfile function from the ProfileViewModel.
    ref.read(profileViewModelProvider.notifier).updateProfile(context, profile);
  }

  @override
  Widget build(BuildContext context) {
    var userState = ref.watch(profileViewModelProvider);
    profile = userState.profiles;
    print("PROFILES");
    print(profile);
    _userName = profile[0].fullName ?? "";
    _phoneNum = profile[0].phoneNumber ?? "";
    // _fullNameController.text = _userName!;
    // _phoneNumController.text = _phoneNum!;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      "Edit Profile",
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
                          : profile[0].profile != null
                              ? NetworkImage(apiBaseUrl + profile[0].profile!)
                              : const AssetImage('assets/images/profile.jpg')
                                  as ImageProvider,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: height * .07,
                  width: 300,
                  child: TextFormField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 20), // add padding to adjust text
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: "Full Name",
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            top: 1), // add padding to adjust icon
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
                    controller: _phoneNumController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 20), // add padding to adjust text
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: "Phone Number",
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            top: 1), // add padding to adjust icon
                        child: Icon(Icons.phone),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
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
                            const Icon(Icons.edit_document,
                                color: Colors.white),
                            Text(_selectedFileName ?? 'Upload Here',
                                style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: height * .05,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      _updateProfileData();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 87, 201, 90),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    child: const Text("Update Profile"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
