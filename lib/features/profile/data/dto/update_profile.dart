import 'package:json_annotation/json_annotation.dart';

import '../model/profile_api_model.dart';

@JsonSerializable()
class GetAllProfileDTO {
  final bool success;
  final int count;
  final List<ProfileApiModel> data;

  GetAllProfileDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  factory GetAllProfileDTO.fromJson(Map<String, dynamic> json) {
    return GetAllProfileDTO(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProfileApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'count': count,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}
