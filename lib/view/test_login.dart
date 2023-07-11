import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddJobView extends ConsumerStatefulWidget {
  const AddJobView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddJobViewState();
}

class _AddJobViewState extends ConsumerState<AddJobView> {
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
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
                          "Add Job",
                          style: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: const Icon(Icons.notifications_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: const Icon(Icons.settings_outlined),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.03),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 131,
                    height: 39,
                    child: Text(
                      'Add Job',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontFamily: 'IM FELL English',
                        fontWeight: FontWeight.w400,
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
