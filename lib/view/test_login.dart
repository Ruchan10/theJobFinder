//   import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// import '../features/search/domain/entity/job_entity.dart';
// import '../features/search/presentation/viewmodel/job_view_model.dart';

// File? _logo;
//   String? _selectedFileName;
//   final companyName = TextEditingController();
//   final jobTitle = TextEditingController();
//   final qualifications = TextEditingController();
//   final jobSalary = TextEditingController();
//   final workLocation = TextEditingController();
//   String dropdownValue = 'Job Time';

//   Future _browseLogo() async {
//     final permissionStatus = await Permission.storage.status;
//     print(permissionStatus);
//     if (permissionStatus.isDenied) {
//       // Here just ask for the permission for the first time
//       await Permission.storage.request();
//       print("DENIED");

//       // I noticed that sometimes popup won't show after user press deny
//       // so I do the check once again but now go straight to appSettings
//       if (permissionStatus.isDenied) {
//         await openAppSettings();
//       }
//     } else if (permissionStatus.isPermanentlyDenied) {
//       // Here open app settings for user to manually enable permission in case
//       // where permission was permanently denied
//       print("PERMANANTLY DENIED");
//       await openAppSettings();
//     } else {
//       try {
//         final image =
//             await ImagePicker().pickImage(source: ImageSource.gallery);

//         if (image != null) {
//           setState(() {
//             _logo = File(image.path);
//             _selectedFileName = image.name;
//           });
//         } else {
//           // User canceled the file picking process or no files were selected.
//         }
//       } catch (e) {
//         debugPrint(e.toString());
//       }
//     }
//   }

//   void _addJobData() {
//     final title = jobTitle.text;
//     final desc = qualifications.text;
//     final company = companyName.text;
//     final location = workLocation.text;
//     final salary = jobSalary.text;

//     final newJob = JobEntity(
//         title: title,
//         desc: desc,
//         company: company,
//         jobTime: dropdownValue,
//         location: location,
//         logo: _logo!.path,
//         salary: salary);
//     ref.read(jobViewModelProvider.notifier).addJob(context, newJob);
//   }

//   final gap = const SizedBox(height: 8);
