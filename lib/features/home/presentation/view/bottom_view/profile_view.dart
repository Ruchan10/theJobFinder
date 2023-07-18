import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/common/provider/internet_connectivity.dart';
import '../../../../../widgets/settings_btn.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  late double screenWidth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    final internetStatus = ref.watch(connectivityStatusProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                // padding: const EdgeInsets.all(16.0),
                child: const Icon(Icons.arrow_back, color: Colors.green),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                child: const Icon(Icons.circle_outlined,
                    size: 150, color: Color.fromARGB(255, 167, 239, 170)),
              ),
              const Text(
                "User Name",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              getSettingsBtn(
                text: "Edit Profile",
                icon: const Icon(Icons.person_2_outlined,
                    size: 40, color: Colors.purple),
              ),
              const SizedBox(height: 15),
              getSettingsBtn(
                text: "Applications",
                icon: const Icon(Icons.dashboard_customize_outlined,
                    size: 40, color: Colors.green),
              ),
              const SizedBox(height: 15),
              getSettingsBtn(
                text: "Notifications",
                icon: const Icon(Icons.notifications,
                    size: 40, color: Colors.brown),
              ),
              const SizedBox(height: 15),
              getSettingsBtn(
                text: "Delete Account",
                icon: const Icon(Icons.delete, size: 40, color: Colors.red),
              ),
              const SizedBox(height: 15),
              getSettingsBtn(
                text: "Share App",
                icon: const Icon(Icons.share, size: 40, color: Colors.yellow),
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
                  Container(
                    height: 70,
                    width: screenWidth * 0.3,
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit_document, color: Colors.white),
                        Text("Upload Here",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              getSettingsBtn(
                text: "Log Out",
                icon: const Icon(Icons.logout, size: 50, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
