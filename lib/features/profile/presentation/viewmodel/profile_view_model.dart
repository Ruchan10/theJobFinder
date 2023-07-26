import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/use_case/profile_use_case.dart';
import '../state/profile_state.dart';

final profileViewModelProvider = StateNotifierProvider<ProfileViewModel, ProfileState>(
  (ref) {
    return ProfileViewModel(ref.read(profileUsecaseProvider));
  },
);

class ProfileViewModel extends StateNotifier<ProfileState> {
  final ProfileUseCase profileUseCase;

  ProfileViewModel(this.profileUseCase) : super(ProfileState.initial()) {
    getAllProfiles();
  }

  addProfile(ProfileEntity profile) async {
    state.copyWith(isLoading: true);
    var data = await profileUseCase.addProfile(profile);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  getAllProfiles() async {
    state = state.copyWith(isLoading: true);
    var data = await profileUseCase.getAllProfiles();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, profiles: r),
    );
  }

  Future<void> removeBookmark(BuildContext context, ProfileEntity profile) async {
    state.copyWith(isLoading: true);
    var data = await profileUseCase.removeBookmark(profile.profileId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        // state.profiles.remove(profile);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Bookmark Removed',
          context: context,
        );
      },
    );
  }

  Future<void> addBookmark(BuildContext context, ProfileEntity profile) async {
    state.copyWith(isLoading: true);
    var data = await profileUseCase.addBookmark(profile.profileId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        // state.profiles.remove(profile);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Bookmark Added',
          context: context,
        );
      },
    );
  }
}
