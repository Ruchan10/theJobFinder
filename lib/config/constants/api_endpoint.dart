class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:3000/";

  // ====================== Auth Routes ======================
  static const String login = "auth/login";
  static const String register = "auth/signup";
  static const String uploadImage = "auth/uploadImage";
  static const String changePassword = "auth/changePassword/";

  // ====================== Job Routes ======================
  static const String getAllJobs = "jobs/";
  static const String getJobById = "jobs/id/";
  static const String getJobByTitle = "jobs/getJob/";
  static const String createJob = "jobs/";
  static const String updateJob = "jobs/";
  static const String deleteJob = "jobs/";
  static const String addBookmark = "jobs/addBookmark/";
  static const String removeBookmark = "jobs/removeBookmark/";
  static const String withdrawJob = "jobs/withdraw/";
  static const String getApplied = "jobs/getAppliedJobs/";
  static const String applyJob = "jobs/applyJob/";
  static const String getCreated = "jobs/user/";
  static const String getBookmark = "jobs/getBookmarked/";
  static const String getApplicants = "jobs/applicants/";
  static const String rejectApplicant = "jobs/reject/";
  static const String acceptApplicant = "jobs/acceptedUser/";

  // ====================== User Routes ======================
  static const String getUserDetails = "users/profile/";
  static const String deleteUser = "users/profile/";
  static const String updateProfile = "users/editProfile/";
  static const String changeEmail = "users/changeEmail/";
  static const String getNoti = "users/getNoti/";
  static const String clearNoti = "users/clearNoti/";
  static const String addNoti = "users/addNoti/";

  // ====================== Extra Routes ======================
  static const String searchQuery = "search/mainSearch/";
}
