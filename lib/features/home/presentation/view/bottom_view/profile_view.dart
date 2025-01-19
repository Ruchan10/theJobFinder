import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/config/router/app_route.dart';
import 'package:the_job_finder/features/auth/domain/entity/change_email_entity.dart';

import '../../../../../widgets/settings_btn.dart';
import '../../../../auth/domain/entity/change_password_entity.dart';
import '../../../../auth/presentation/viewmodel/auth_view_model.dart';
import '../../../../profile/domain/entity/profile_entity.dart';
import '../../../../profile/presentation/viewmodel/profile_view_model.dart';
import '../../viewmodel/home_viewmodel.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  late double screenWidth;
  List<ProfileEntity> profile = [];
  final String apiBaseUrl = 'http://192.168.1.6:3000/';
  String? _userName = "User";
  String? _email;
  String? _profileImg;

  final _getEmail = TextEditingController();
  final _confirmEmail = TextEditingController();
  final _getPw = TextEditingController();
  final _cPw = TextEditingController();
  final _currentPw = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    var userState = ref.watch(profileViewModelProvider);
    profile = userState.profiles;

    // Check if profile list is not empty before accessing its elements
    if (profile.isNotEmpty) {
      _userName = profile[0].fullName;
      _profileImg = profile[0].profile;
      _email = profile[0].email;
    } else {
      _userName = "RK"; // Default value when profile is empty
    }
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
              CircleAvatar(
                radius: 70,
                backgroundImage: _profileImg != null
                    ? NetworkImage(apiBaseUrl + profile[0].profile!)
                    : const AssetImage('assets/images/pp.webp')
                        as ImageProvider,
              ),
              Text(
                "$_userName",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.editProfileRoute);
                },
                child: getSettingsBtn(
                  text: "Edit Profile",
                  icon: const Icon(Icons.person_2_outlined,
                      size: 40, color: Colors.purple),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.applicationsRoute);
                },
                child: getSettingsBtn(
                  text: "Applications",
                  icon: const Icon(Icons.dashboard_customize_outlined,
                      size: 40, color: Colors.green),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  _showModal(context);
                },
                child: getSettingsBtn(
                  text: "Change Email",
                  icon: const Icon(Icons.email, size: 40, color: Colors.brown),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  _showModal0(context);
                },
                child: getSettingsBtn(
                  text: "Change Password",
                  icon:
                      const Icon(Icons.password, size: 40, color: Colors.brown),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  _showDeleteModal(context);
                },
                child: getSettingsBtn(
                  text: "Delete Account",
                  icon: const Icon(Icons.delete, size: 40, color: Colors.red),
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  ref.read(homeViewModelProvider.notifier).logout(context);
                },
                child: getSettingsBtn(
                  text: "Log Out",
                  icon: const Icon(Icons.logout, size: 50, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return the widget that will be the content of the dialog
        return FittedBox(
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Change Email'),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            content: Column(
              children: [
                Text('Current Email:- $_email'),
                const SizedBox(height: 10),
                SizedBox(
                  // width: 300,
                  child: TextFormField(
                    controller: _getEmail,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 20), // add padding to adjust text
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: "New email",
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            top: 1), // add padding to adjust icon
                        child: Icon(Icons.email),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  // width: 300,
                  child: TextFormField(
                    controller: _confirmEmail,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 20), // add padding to adjust text
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: "Re-enter New email",
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            top: 1), // add padding to adjust icon
                        child: Icon(Icons.email),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  String email = _getEmail.text.trim();
                  String confirmEmail = _confirmEmail.text.trim();
                  var emails = ChangeEmailEntity(
                      email: email, confirmEmail: confirmEmail);
                  ref
                      .read(authViewModelProvider.notifier)
                      .changeEmail(emails, context);
                  Navigator.of(context).pop();
                },
                child: const Text('Change'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showModal0(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return the widget that will be the content of the dialog
        return FittedBox(
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Change Password'),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            content: Column(
              children: [
                SizedBox(
                  child: TextFormField(
                    controller: _currentPw,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 20), // add padding to adjust text
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: "Current password",
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            top: 1), // add padding to adjust icon
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  child: TextFormField(
                    controller: _cPw,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 20), // add padding to adjust text
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: "New Password",
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            top: 1), // add padding to adjust icon
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  // width: 300,
                  child: TextFormField(
                    controller: _getPw,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 20), // add padding to adjust text
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: "Re-enter New Password",
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            top: 1), // add padding to adjust icon
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  print("IN change Pw");
                  String cPw = _currentPw.text.trim();
                  String pw = _getPw.text.trim();
                  String confirmPw = _cPw.text.trim();
                  var pws = ChangePasswordEntity(
                      pw: pw, cpw: confirmPw, currentPw: cPw);
                  ref
                      .read(authViewModelProvider.notifier)
                      .changePassword(pws, context);
                  Navigator.of(context).pop();
                },
                child: const Text('Change'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return the widget that will be the content of the dialog
        return FittedBox(
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Delete Account !!!'),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            content: Column(
              children: [
                const Text("Are you sure you want to delete?"),
                const SizedBox(height: 8),
                SizedBox(
                  child: TextFormField(
                    // controller: _emailController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 20), // add padding to adjust text
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: "Enter Password",
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            top: 1), // add padding to adjust icon
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  // Close the modal when this button is pressed
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  // Close the modal when this button is pressed
                  Navigator.of(context).pop();
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
    );
  }
}
