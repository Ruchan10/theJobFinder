import 'package:flutter/material.dart';
import 'package:the_job_finder/config/router/app_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student App',
      // theme: AppTheme.getApplicationTheme(),
      initialRoute: AppRoute.loginRoute,
      routes: AppRoute.getAppRoutes(),
    );
  }
}
