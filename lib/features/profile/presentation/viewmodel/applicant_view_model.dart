import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/use_case/profile_use_case.dart';
import '../state/profile_state.dart';

final applicantViewModelProvider =
    StateNotifierProvider<ApplicantViewModel, ProfileState>(
  (ref) {
    return ApplicantViewModel(ref.read(profileUsecaseProvider));
  },
);

class ApplicantViewModel extends StateNotifier<ProfileState> {
  final ProfileUseCase applicantUseCase;

  ApplicantViewModel(this.applicantUseCase) : super(ProfileState.initial());

  getApplicants(String userId) async {
    state = state.copyWith(isLoading: true);
    var data = await applicantUseCase.getApplicants(userId);
    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, profiles: r),
    );
  }
}
