import 'package:flutter/material.dart';
import 'package:the_job_finder/widgets/company_card.dart';
import 'package:the_job_finder/widgets/pill_btns_icons.dart';

class homeView extends StatefulWidget {
  const homeView({super.key});

  @override
  State<homeView> createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: height * .05,
                  width: width,
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Welcome Home",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        child: Row(children: [
                          IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: const Icon(Icons.notifications),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: const Icon(Icons.circle_outlined, size: 50),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * .1,
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  child: const Text(
                    "     Ruchan Kayastha",
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: height * .35,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromARGB(255, 143, 243, 146),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "  Quick Search",
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "You can search quickly for the job you want",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(height: height * .01),
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
                                padding: EdgeInsets.only(
                                    top: 1), // add padding to adjust icon
                                child: Icon(Icons.search),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white),
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
                ),
                SizedBox(height: height * .04),
                Row(
                  children: [
                    getPillBtnIcon(
                      "All",
                      const Icon(Icons.all_inbox),
                      color: const Color.fromARGB(255, 184, 245, 187),
                    ),
                    SizedBox(width: width * .05),
                    getPillBtnIcon(
                      "Recents",
                      const Icon(Icons.recent_actors),
                    ),
                    SizedBox(width: width * .05),
                    getPillBtnIcon(
                      "Popular",
                      const Icon(Icons.power_input),
                    ),
                  ],
                ),
                SizedBox(height: height * .05),
                Row(
                  // scrollDirection: Axis.horizontal,
                  children: [
                    getCompanyCardSmall(
                      context,
                      width,
                      height,
                      "Apple",
                      "Software Engineer",
                      "1 Infinite Loop, Cupertino",
                    ),
                    SizedBox(width: width * .03),
                    getCompanyCardSmall(
                      context,
                      width,
                      height,
                      "Google",
                      "Manager",
                      "Mountain View, CA 94043, USA",
                    ),
                  ],
                ),
                SizedBox(height: height * .04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
