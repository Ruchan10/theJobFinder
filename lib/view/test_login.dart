import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GFTabBar(
            length: 2,
            controller: tabController,
            tabs: const [
              Tab(
                child: Text(
                  "Applied",
                ),
              ),
              Tab(
                child: Text(
                  "Received",
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                Center(child: Text("a")), // Content for "Applied" tab
                Center(child: Text("r")), // Content for "Received" tab
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Don't forget to dispose of the tabController when it's no longer needed
    tabController.dispose();
    super.dispose();
  }
}
