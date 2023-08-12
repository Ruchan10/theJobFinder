import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../../search/domain/entity/job_entity.dart';
import '../../../search/presentation/state/job_state.dart';
import '../../domain/use_case/application_use_case.dart';

final applicationViewModelProvider =
    StateNotifierProvider<ApplicationViewModel, JobState>(
  (ref) {
    return ApplicationViewModel(ref.read(applicationUsecaseProvider));
  },
);

class ApplicationViewModel extends StateNotifier<JobState> {
  final ApplicationUseCase applicationUseCase;

  ApplicationViewModel(this.applicationUseCase) : super(JobState.initial());

  Future<void> deleteJob(BuildContext context, JobEntity application) async {
    state.copyWith(isLoading: true);
    var data = await applicationUseCase.deleteJob(application.jobId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state.jobs.remove(application);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Job Deleted',
          context: context, color: Colors.red
        );
      },
    );
  }
}
