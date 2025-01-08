import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_job_finder/core/failure/failure.dart';
import 'package:the_job_finder/features/auth/domain/use_case/auth_usecase.dart';
import 'package:the_job_finder/features/auth/presentation/viewmodel/auth_view_model.dart';

import 'login_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  late AuthUseCase mockAuthUseCase;
  late ProviderContainer container;
  late BuildContext context;

  setUpAll(() {
    mockAuthUseCase = MockAuthUseCase();
    context = MockBuildContext();
    container = ProviderContainer(
      overrides: [
        authViewModelProvider.overrideWith(
          (ref) => AuthViewModel(mockAuthUseCase),
        ),
      ],
    );
  });
  test('check for initial login state', () {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, isNull);
  });
  test('Login test with valid username and password', () async {
    when(mockAuthUseCase.loginUser('rk', 'rk'))
        .thenAnswer((_) => Future.value(const Right(false)));

    await container
        .read(authViewModelProvider.notifier)
        .loginUser(context, 'rk', 'rk');

    final authState = container.read(authViewModelProvider);

    expect(authState.error, isNull);
  });

  test('Login test with invalid username and password', () async {
    when(mockAuthUseCase.loginUser('rk', 'rk')).thenAnswer(
        (_) => Future.value(Left(Failure(error: 'Invalid Credentials'))));

    await container
        .read(authViewModelProvider.notifier)
        .loginUser(context, 'rk0', 'rk0');

    final authState = container.read(authViewModelProvider);

    expect(authState.error, 'Invalid Credentials');
  });

  tearDownAll(() {
    container.dispose();
  });
}
