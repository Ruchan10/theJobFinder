import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:the_job_finder/features/search/domain/entity/job_entity.dart';
import 'package:the_job_finder/features/search/presentation/viewmodel/job_view_model.dart';

class AddJobView extends ConsumerStatefulWidget {
  const AddJobView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddJobViewState();
}

class _AddJobViewState extends ConsumerState<AddJobView> {
  File? _logo;
  String? _selectedFileName;
  final companyName = TextEditingController();
  final jobTitle = TextEditingController();
  final qualifications = TextEditingController();
  final jobSalary = TextEditingController();
  final workLocation = TextEditingController();
  String dropdownValue = 'Job Time';

  Future _browseLogo() async {
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
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);

        if (image != null) {
          setState(() {
            _logo = File(image.path);
            _selectedFileName = image.name;
          });
        } else {
          // User canceled the file picking process or no files were selected.
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  void _addJobData() {
    final title = jobTitle.text;
    final desc = qualifications.text;
    final company = companyName.text;
    final location = workLocation.text;
    final salary = jobSalary.text;

    final newJob = JobEntity(
        title: title,
        desc: desc,
        company: company,
        jobTime: dropdownValue,
        location: location,
        logo: _logo!.path,
        salary: salary);
    ref.read(jobViewModelProvider.notifier).addJob(context, newJob);
  }

  final gap = const SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          gap,
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Add Job',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: height * .07,
            width: 300,
            child: TextFormField(
              controller: companyName,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.all(20), // add padding to adjust text
                isDense: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                labelText: "Company Name",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          gap,
          SizedBox(
            height: height * .07,
            width: 300,
            child: TextFormField(
              controller: jobTitle,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.all(20), // add padding to adjust text
                isDense: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                labelText: "Job Title",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          gap,
          gap,
          SizedBox(
            height: 200,
            width: width * .82,
            child: TextFormField(
              controller: qualifications,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: "Enter Qualifications and description",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              maxLines: null,
              expands: true,
            ),
          ),
          gap,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Company Logo   ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _browseLogo();
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
          gap,
          Container(
            height: 50,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: ['Job Time', 'Full Time', 'Part Time']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          gap,
          SizedBox(
            height: height * .07,
            width: 300,
            child: TextFormField(
              controller: jobSalary,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.all(20), // add padding to adjust text
                isDense: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                labelText: "Enter Salary, Eg:- \$1000/yr",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          gap,
          SizedBox(
            height: height * .07,
            width: 300,
            child: TextFormField(
              controller: workLocation,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.all(20), // add padding to adjust text
                isDense: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                labelText: "Enter job work location",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: height * .05,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                _addJobData();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 87, 201, 90),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              child: const Text("ADD JOB"),
            ),
          ),
        ],
      ),
    );
  }
}
