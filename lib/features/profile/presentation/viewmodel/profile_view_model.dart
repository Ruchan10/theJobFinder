import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/use_case/profile_use_case.dart';
import '../state/profile_state.dart';

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileState>(
  (ref) {
    return ProfileViewModel(ref.read(profileUsecaseProvider));
  },
);

class ProfileViewModel extends StateNotifier<ProfileState> {
  final ProfileUseCase profileUseCase;

  ProfileViewModel(this.profileUseCase) : super(ProfileState.initial()) {
    getUserDetails();
  }

  updateProfile(BuildContext context, ProfileEntity profile) async {
    state.copyWith(isLoading: true);
    var data = await profileUseCase.updateProfile(profile);

    data.fold((l) => state = state.copyWith(isLoading: false, error: l.error),
        (r) {
      state = state.copyWith(isLoading: false, error: null);
      showSnackBar(
          message: 'Profile Updated Successfully',
          context: context,
          color: Colors.green);
    });
  }


  getUserDetails() async {
    state = state.copyWith(isLoading: true);
    var data = await profileUseCase.getUserDetails();
    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, profiles: r),
    );
  }
}
