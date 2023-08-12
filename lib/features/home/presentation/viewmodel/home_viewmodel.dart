import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/router/app_route.dart';
import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../../../core/shared_prefs/user_shared_pref.dart';
import '../../../search/domain/use_case/job_use_case.dart';
import '../../../search/presentation/state/job_state.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, JobState>(
  (ref) => HomeViewModel(
    ref.read(userSharedPrefsProvider),
    ref.read(jobUsecaseProvider),
  ),
);

class HomeViewModel extends StateNotifier<JobState> {
  final JobUseCase jobUseCase;

  final UserSharedPrefs _userSharedPrefs;
  HomeViewModel(this._userSharedPrefs, this.jobUseCase)
      : super(JobState.initial());

  void logout(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    showSnackBar(
        message: 'Logging out....', context: context, color: Colors.red);

    await _userSharedPrefs.deleteUserToken();
    Future.delayed(const Duration(milliseconds: 2000), () {
      state = state.copyWith(isLoading: false);
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoute.loginRoute,
        (route) => false,
      );
    });
  }

  searchQuery(String searchQuery) async {
    state = state.copyWith(isLoading: true);
    var data = await jobUseCase.searchQuery(searchQuery);

    data.fold(
      (l) => state = state.copyWith(isLoading: true, error: l.error),
      (r) => state = state.copyWith(isLoading: false, jobs: r),
    );
  }
}
