import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/features/bookmark/domain/entity/bookmark_entity.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
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

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, jobs: r),
    );
  }

  Future<void> removeBookmark(BuildContext context, BookmarkEntity job) async {
    state.copyWith(isLoading: true);
    var data = await jobUseCase.removeBookmark(job.bookmarkId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state.jobs.remove(job);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Bookmark Removed',
          context: context,
        );
      },
    );
  }

  Future<void> addBookmark(BuildContext context, JobEntity job) async {
    state.copyWith(isLoading: true);
    var data = await jobUseCase.addBookmark(job.jobId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state.jobs.remove(job);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Bookmark Added',
          context: context,
        );
      },
    );
  }
}
