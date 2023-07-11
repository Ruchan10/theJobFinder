import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/job_entity.dart';
import '../../domain/use_case/job_use_case.dart';
import '../state/job_state.dart';

final jobViewModelProvider = StateNotifierProvider<JobViewModel, JobState>(
  (ref) {
    return JobViewModel(ref.read(jobUsecaseProvider));
  },
);

class JobViewModel extends StateNotifier<JobState> {
  final JobUseCase jobUseCase;

  JobViewModel(this.jobUseCase) : super(JobState.initial()) {
    getAllJobs();
  }

  addJob(JobEntity job) async {
    state.copyWith(isLoading: true);
    var data = await jobUseCase.addJob(job);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  getAllJobs() async {
    state = state.copyWith(isLoading: true);
    var data = await jobUseCase.getAllJobs();
    print("INSIDE JOB VIEW MODEL");
    print(data);
    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, jobs: r, error: null),
    );
  }
}
