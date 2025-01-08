
import '../../domain/entity/job_entity.dart';

class JobState {
  final bool isLoading;
  final List<JobEntity> jobs;
  // final List<AuthEntity>? students;
  final String? error;

  JobState({
    required this.isLoading,
    required this.jobs,
    this.error,
  });

  factory JobState.initial() {
    return JobState(
      isLoading: false,
      jobs: [],
    );
  }

  JobState copyWith({
    bool? isLoading,
    List<JobEntity>? jobs,
    String? error,
  }) {
    return JobState(
      isLoading: isLoading ?? this.isLoading,
      jobs: jobs ?? this.jobs,
      error: error ?? this.error,
    );
  }

}
