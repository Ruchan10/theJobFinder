import 'package:json_annotation/json_annotation.dart';

import '../../../search/data/model/job_api_model.dart';


@JsonSerializable()
class GetCreatedJobDTO {
  final bool success;
  final int count;
  final List<JobApiModel> data;

  GetCreatedJobDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  factory GetCreatedJobDTO.fromJson(Map<String, dynamic> json) {
    return GetCreatedJobDTO(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => JobApiModel.fromJson(e as Map<String, dynamic>))
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
