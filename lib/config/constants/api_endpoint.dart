class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:3000/";
  // static const String baseUrl = "http://192.168.4.4:3000/";

  // ====================== Auth Routes ======================
  static const String login = "auth/login";
  static const String register = "auth/signup";
  static const String uploadImage = "auth/uploadImage";

  // ====================== Job Routes ======================
  static const String getAllJobs = "job/";
  static const String createJob = "job/";
  static const String deleteJob = "job/";

  // ====================== User Routes ======================
  static const String getUserDetails = "users/profile";
  static const String deleteUser = "users/profile";
}
