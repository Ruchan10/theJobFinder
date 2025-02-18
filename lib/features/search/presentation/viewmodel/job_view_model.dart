import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/core/failure/failure.dart';

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

  addJob(BuildContext context, JobEntity job) async {
    state.copyWith(isLoading: true);
    var data = await jobUseCase.addJob(job);

    data.fold((l) => state = state.copyWith(isLoading: false, error: l.error),
        (r) {
      state = state.copyWith(isLoading: false, error: null);
      showSnackBar(message: 'Job Added', context: context, color: Colors.green);
    });
  }

  getAllJobs() async {
    state = state.copyWith(isLoading: true);
    var data = await jobUseCase.getAllJobs();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, jobs: r),
    );
  }

  Future<void> removeBookmark(BuildContext context, JobEntity job) async {
    state.copyWith(isLoading: true);
    var data = await jobUseCase.removeBookmark(job.jobId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Bookmark Removed',
          context: context,
        );
      },
    );
  }

  Future<void> withdrawJob(BuildContext context, dynamic job) async {
    state.copyWith(isLoading: true);
    Either<Failure, bool> data;
    try {
      data = await jobUseCase.applyJob(job.bookmarkId);
    } catch (e) {
      data = await jobUseCase.applyJob(job.jobId);
    }

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Job Withdrawed',
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
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Bookmark Added',
          context: context,
        );
      },
    );
  }

  Future<void> applyJob(BuildContext context, dynamic job) async {
    state.copyWith(isLoading: true);
    Either<Failure, bool> data;
    print("job");
    // print(job.bookmarkId);
    try {
      data = await jobUseCase.applyJob(job.bookmarkId);
    } catch (e) {
      data = await jobUseCase.applyJob(job.jobId);
    }
    // if (job.bookmarkId != null) {
    //   print("in bokmark");
    //   data = await jobUseCase.applyJob(job.bookmarkId);
    // } else {
    //   data = await jobUseCase.applyJob(job.jobId!);
    // }

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Job Applied',
          context: context,
        );
      },
    );
  }

  Future<void> getCreated() async {
    state = state.copyWith(isLoading: true);
    var data = await jobUseCase.getCreated();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, jobs: r),
    );
  }

  Future<void> getApplied() async {
    state = state.copyWith(isLoading: true);
    var data = await jobUseCase.getApplied();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, jobs: r),
    );
  }
}
