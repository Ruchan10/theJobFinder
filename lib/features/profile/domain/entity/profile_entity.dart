import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? profileId;
  final String fullName;
  final String email;
  final String phoneNum;
  final String cvFile;
  final String profilePic;
  @override
  List<Object?> get props => [
        profileId,
        fullName,
        email,
        phoneNum,
        cvFile,
        profilePic,
      ];

  const ProfileEntity({
    this.profileId,
    required this.fullName,
    required this.email,
    required this.phoneNum,
    required this.cvFile,
    required this.profilePic,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) => ProfileEntity(
        profileId: json["profileId"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNum: json["phoneNum"],
        cvFile: json["cvFile"],
        profilePic: json["profilePic"],
      );

  Map<String, dynamic> toJson() => {
        "profileId": profileId,
        "fullName": fullName,
        "email": email,
        "phoneNum": phoneNum,
        "cvFile": cvFile,
        "profilePic": profilePic,
      };

  @override
  String toString() {
    return 'ProfileEntity(profileId: $profileId, fullName: $fullName, email: $email, phoneNum: $phoneNum, cvFile: $cvFile,profilePic:$profilePic)';
  }
}
