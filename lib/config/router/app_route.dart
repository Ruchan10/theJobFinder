import 'package:the_job_finder/features/auth/presentation/view/login_view.dart';
import 'package:the_job_finder/features/auth/presentation/view/signup_view.dart';
import 'package:the_job_finder/features/home/presentation/view/bottom_view/bookmark_view.dart';
import 'package:the_job_finder/features/home/presentation/view/dashboard_view.dart';
import 'package:the_job_finder/view/test_login.dart';

import '../../features/home/presentation/view/bottom_view/home_view.dart';
import '../../features/home/presentation/view/bottom_view/profile_view.dart';
import '../../features/home/presentation/view/bottom_view/search_view.dart';

class AppRoute {
  AppRoute._();

  static const String bookmarkRoute = '/bookmarkRoute';
  static const String loginRoute = '/loginRoute';
  static const String dashboardRoute = '/dashboardRoute';
  static const String homeRoute = '/homeRoute';
  static const String profileRoute = '/profileRoute';
  static const String searchRoute = '/searchRoute';
  static const String signupRoute = '/signupRoute';
  static const String jobRoute = '/jobRoute';

  static getAppRoutes() {
    return {
      bookmarkRoute: (context) => const bookmarkView(),
      dashboardRoute: (context) => const dashBoardView(),
      loginRoute: (context) => const LoginView(),
      jobRoute: (context) => const AddJobView(),
      homeRoute: (context) => const homeView(),
      profileRoute: (context) => const profileView(),
      searchRoute: (context) => const SearchView(),
      signupRoute: (context) => const SignupView(),
    };
  }
}
