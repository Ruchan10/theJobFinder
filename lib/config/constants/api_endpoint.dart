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
  static const String getAllJobs = "jobs/";
  static const String getJobById = "jobs/id";
  static const String getJobByTitle = "jobs/getJob";
  static const String createJob = "jobs/";
  static const String updateJob = "jobs/";
  static const String deleteJob = "jobs/";
  static const String addBookmark = "jobs/addBookmark";
  static const String removeBookmark = "jobs/removeBookmark";
  static const String getBookmark = "jobs/getBookmarked";

  // ====================== User Routes ======================
  static const String getUserDetails = "users/profile";
  static const String deleteUser = "users/profile";
}
