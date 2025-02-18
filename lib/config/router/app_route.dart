import 'package:the_job_finder/features/applications/presentation/view/applications_view.dart';
import 'package:the_job_finder/features/auth/presentation/view/login_view.dart';
import 'package:the_job_finder/features/auth/presentation/view/signup_view.dart';
import 'package:the_job_finder/features/home/presentation/view/bottom_view/bookmark_view.dart';
import 'package:the_job_finder/features/home/presentation/view/dashboard_view.dart';
import 'package:the_job_finder/features/search/presentation/view/Add_Job_view.dart';
import 'package:the_job_finder/features/splash/presentation/view/splash_view.dart';

import '../../features/home/presentation/view/bottom_view/home_view.dart';
import '../../features/home/presentation/view/bottom_view/profile_view.dart';
import '../../features/home/presentation/view/bottom_view/search_view.dart';
import '../../features/profile/presentation/view/edit_profile_view.dart';
import '../../view/test_login.dart';

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
  static const String editProfileRoute = '/editProfileRoute';
  static const String applicationsRoute = '/applicationsRoute';
  static const String addJobRoute = '/addJobRoute';
  static const String splashRoute = '/splashRoute';
  static const String proximityRoute = '/proximityRoute';

  static getAppRoutes() {
    return {
      bookmarkRoute: (context) => const BookmarkView(),
      dashboardRoute: (context) => const dashBoardView(),
      loginRoute: (context) => const LoginView(),
      jobRoute: (context) => const SearchView(),
      homeRoute: (context) => const homeView(),
      profileRoute: (context) => const ProfileView(),
      searchRoute: (context) => const SearchView(),
      signupRoute: (context) => const SignupView(),
      editProfileRoute: (context) => const UpdateProfile(),
      addJobRoute: (context) => const AddJobView(),
      applicationsRoute: (context) => const ApplicationsView(),
      splashRoute: (context) => const SplashView(),
    };
  }
}
