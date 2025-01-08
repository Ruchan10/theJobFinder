import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../search/domain/use_case/job_use_case.dart';
import '../../../search/presentation/state/job_state.dart';

final createdViewModelProvider = StateNotifierProvider<JobViewModel, JobState>(
  (ref) {
    return JobViewModel(ref.read(jobUsecaseProvider));
  },
);

class JobViewModel extends StateNotifier<JobState> {
  final JobUseCase jobUseCase;

  JobViewModel(this.jobUseCase) : super(JobState.initial()) {
    getCreated();
  }



   getCreated() async {
    state = state.copyWith(isLoading: true);
    var data = await jobUseCase.getCreated();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, jobs: r),
    );
  }
}
