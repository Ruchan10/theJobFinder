import 'package:flutter/material.dart';

class testView extends StatefulWidget {
  const testView({super.key});

  @override
  State<testView> createState() => _testViewState();
}

class _testViewState extends State<testView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        SizedBox(height: height * .2),
        Stack(
          children: <Widget>[
            SizedBox(height: height * .1),
            Positioned(
              top: -10.0,
              right: 0.0,
              child: ClipRect(
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                width: double.infinity,
                height: height * .1,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 47, 255, 54),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.location_on),
                ),
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
