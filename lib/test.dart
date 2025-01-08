import 'package:flutter/material.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TabBar Example"),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white, 
          labelColor: Colors.white, 
          unselectedLabelColor: Colors.grey, 
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
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(child: Text("Applied Jobs")),
          Center(child: Text("Received Applications")),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: TabBarExample()));
