import 'package:flutter/material.dart';
import 'package:the_job_finder/widgets/company_card.dart';

class bookmarkView extends StatefulWidget {
  const bookmarkView({super.key});

  @override
  State<bookmarkView> createState() => _bookmarkViewState();
}

class _bookmarkViewState extends State<bookmarkView> {
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
                          "Bookmark",
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
              SizedBox(height: height * 0.02),
              Positioned(
                child: SizedBox(
                  height: height * .702,
                  child: Column(
                    children: [
                      getCompanyCard(
                          context,
                          "Apple",
                          "Software Engineer",
                          "1 Infinite Loop, Cupertino, California",
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
