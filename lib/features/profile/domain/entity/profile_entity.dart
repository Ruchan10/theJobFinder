import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? profileId;
  final String? fullName;
  final String? email;
  final String? cv;
  final String? profile;
  final String? password;
  final String? phoneNumber;
  final List<String>? bookmarkedJobs;
  final List<String>? appliedJobs;

  @override
  List<Object?> get props => [
        profileId,
        fullName,
        email,
        cv,
        password,
        phoneNumber,
        bookmarkedJobs,
        appliedJobs,
        profile,
      ];

  const ProfileEntity({
    this.profileId,
    this.fullName,
    this.email,
    this.cv,
    this.profile,
    this.appliedJobs,
    this.bookmarkedJobs,
    this.password,
    this.phoneNumber,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) => ProfileEntity(
        profileId: json["profileId"],
        fullName: json["fullName"],
        email: json["email"],
        cv: json["cv"],
        profile: json["profile"],
        password: json["password"],
        appliedJobs: json["appliedJobs"],
        bookmarkedJobs: json["bookmarkedJobs"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "profileId": profileId,
        "fullName": fullName,
        "email": email,
        "cv": cv,
        "profile": profile,
        "password": password,
        "phoneNumber": phoneNumber,
        "bookmarkedJobs": bookmarkedJobs,
        "appliedJobs": appliedJobs,
      };

  @override
  String toString() {
    return 'ProfileEntity(profileId: $profileId, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, cv: $cv,profile:$profile, appliedJobs:$appliedJobs,bookmarkedJobs:$bookmarkedJobs,password:$password,)';
  }
}
