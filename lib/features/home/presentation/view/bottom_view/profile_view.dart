import 'package:flutter/material.dart';
import 'package:the_job_finder/widgets/settings_btn.dart';

class profileView extends StatefulWidget {
  const profileView({super.key});

  @override
  State<profileView> createState() => _profileViewState();
}

class _profileViewState extends State<profileView> {
  var gap0 = const SizedBox(width: 70);
  var setH = const SizedBox(height: 15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: const Icon(Icons.arrow_back),
              ),
              Container(
                alignment: Alignment.center,
                child: const Icon(Icons.circle_outlined, size: 150),
              ),
              const Text(
                "User Name",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              getSettingsBtn(
                "Edit Profile",
                const Icon(Icons.person_2_outlined, size: 30),
              ),
              setH,
              getSettingsBtn(
                "Applications",
                const Icon(Icons.dashboard_customize_outlined, size: 30),
              ),
              setH,
              getSettingsBtn(
                "Notifications",
                const Icon(Icons.notifications, size: 30),
              ),
              setH,
              getSettingsBtn(
                "Delete Account",
                const Icon(Icons.delete, size: 30),
              ),
              setH,
              getSettingsBtn(
                "Share App",
                const Icon(Icons.share, size: 30),
              ),
              setH,
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
                  Container(
                    height: 70,
                    width: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit_document),
                        Text("Upload Here"),
                      ],
                    ),
                  )
                ],
              ),
              setH,
              setH,
              getSettingsBtn(
                "Log Out",
                const Icon(Icons.logout, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
