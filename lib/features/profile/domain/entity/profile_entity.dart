import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? profileId;
  final String? fullName;
  final String? email;
  final String? phoneNum;
  final String? cv;
  final String? profile;
  @override
  List<Object?> get props => [
        profileId,
        fullName,
        email,
        phoneNum,
        cv,
        profile,
      ];

  const ProfileEntity({
    this.profileId,
     this.fullName,
     this.email,
     this.phoneNum,
     this.cv,
     this.profile,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) => ProfileEntity(
        profileId: json["profileId"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNum: json["phoneNum"],
        cv: json["cv"],
        profile: json["profile"],
      );

  Map<String, dynamic> toJson() => {
        "profileId": profileId,
        "fullName": fullName,
        "email": email,
        "phoneNum": phoneNum,
        "cv": cv,
        "profile": profile,
      };

  @override
  String toString() {
    return 'ProfileEntity(profileId: $profileId, fullName: $fullName, email: $email, phoneNum: $phoneNum, cv: $cv,profile:$profile)';
  }
}
