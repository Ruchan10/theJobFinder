import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_job_finder/features/auth/domain/entity/user_hive_entity.dart';
import 'package:the_job_finder/features/auth/domain/use_case/auth_usecase.dart';
import 'package:the_job_finder/features/auth/presentation/state/auth_state.dart';

import '../../../../config/router/app_route.dart';
import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/change_email_entity.dart';
import '../../domain/entity/change_password_entity.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    ref.read(authUseCaseProvider),
  );
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;

  AuthViewModel(this._authUseCase) : super(AuthState(isLoading: false));

  Future<void> registerUser(UserEntity user, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.registerUser(user);
    data.fold(
        (failure) => state = state.copyWith(
              isLoading: false,
              error: failure.error,
            ),
        (success) => {
              state = state.copyWith(
                isLoading: false,
                error: null,
              ),
              showSnackBar(
                message: 'Email Changed Successfully',
                context: context,
                color: Colors.green,
              )
            });
  }

  Future<void> changeEmail(
      ChangeEmailEntity emails, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.changeEmail(emails);
    data.fold(
        (failure) => state = state.copyWith(
              isLoading: false,
              error: failure.error,
            ),
        (success) => {
              state = state.copyWith(
                isLoading: false,
                error: null,
              ),
              showSnackBar(
                message: 'Email Changed Successfully',
                context: context,
                color: Colors.green,
              )
            });
  }

  Future<void> changePassword(
      ChangePasswordEntity pws, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.changePassword(pws);
    data.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (success) => {
        state = state.copyWith(
          isLoading: false,
          error: null,
        ),
        showSnackBar(
          message: 'Password Changed Successfully',
          context: context,
          color: Colors.green,
        ),
      },
    );
  }

  Future<bool> loginUser(
      BuildContext context, String username, String password) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.loginUser(username, password);
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showSnackBar(
            message: 'Invalid credentials',
            context: context,
            color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        Navigator.popAndPushNamed(context, AppRoute.dashboardRoute);
      },
    );

    return false;
  }

  Future<void> addNoti(String noti) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.addNoti(noti);
    data.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (success) => {
        state = state.copyWith(
          isLoading: false,
          error: null,
        ),
      },
    );
  }
}
