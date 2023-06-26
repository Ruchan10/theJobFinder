import 'package:flutter/material.dart';
import 'package:the_job_finder/widgets/pillButtons.dart';

import '../widgets/company_card.dart';

class searchView extends StatefulWidget {
  const searchView({super.key});

  @override
  State<searchView> createState() => _searchViewState();
}

class _searchViewState extends State<searchView> {
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
                // height: height * .15,
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
                          "Search",
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
                    SizedBox(
                      width: width * .7,
                      child: const TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(
                              top: 20), // add padding to adjust text

                          labelText: "Search",
                          prefixIcon: Padding(
                            padding:
                                EdgeInsets.all(1), // add padding to adjust icon
                            child: Icon(Icons.search),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(Icons.filter_list_sharp),
                  ),
                  SizedBox(width: width * .04),
                  getPillBtn("All",
                      color: const Color.fromARGB(255, 184, 245, 187)),
                  SizedBox(width: width * .04),
                  getPillBtn("Part Time"),
                  SizedBox(width: width * .04),
                  getPillBtn("10-50k"),
                ],
              ),
              SizedBox(height: height * 0.02),
              Positioned(
                child: SizedBox(
                  height: height * .65,
                  child: Column(
                    children: [
                      getCompanyCard(
                          context,
                          width,
                          height,
                          "Apple",
                          "Software Engineer",
                          "1 Infinite Loop, Cupertino, California",
                          "Full Time"),
                      SizedBox(height: height * 0.01),
                      getCompanyCard(
                          context,
                          width,
                          height,
                          "Google",
                          "Manager",
                          "Mountain View, CA 94043, USA",
                          "Full Time"),
                      SizedBox(height: height * 0.01),
                      getCompanyCard(
                          context,
                          width,
                          height,
                          "Facebook",
                          "C.F.O",
                          "Menlo Park, California, United States",
                          "Full Time"),
                      SizedBox(height: height * 0.01),
                      getCompanyCard(
                          context,
                          width,
                          height,
                          "Reddit",
                          "C.E.O",
                          "San Francisco, California, United States",
                          "Full Time"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * .04),
              Positioned(
                child: Container(
                  width: double.infinity,
                  height: height * .08,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 143, 243, 146),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
