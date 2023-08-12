import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_job_finder/config/router/app_route.dart';
import 'package:the_job_finder/features/auth/domain/use_case/auth_usecase.dart';
import 'package:the_job_finder/features/auth/presentation/view/login_view.dart';
import 'package:the_job_finder/features/auth/presentation/viewmodel/auth_view_model.dart';

import '../../../../unit_test/login_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
])
void main() {
  late AuthUseCase mockAuthUsecase;
  late bool isLogin;

  setUpAll(() async {
    // Because these mocks are already created in the register_view_test.dart file
    mockAuthUsecase = MockAuthUseCase();
    isLogin = true;
  });
  testWidgets('login view ...', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginView(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Hi !'), findsOneWidget);
  });

  testWidgets('logging', (tester) async {
    when(mockAuthUsecase.loginUser('test1@gmail.com', 'rk'))
        .thenAnswer((_) => Future.value(const Right(true)));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider
              .overrideWith((ref) => AuthViewModel(mockAuthUsecase)),
        ],
        child: const MaterialApp(
          home: LoginView(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(0), 'test1@gmail.com');
    await tester.enterText(find.byType(TextFormField).last, 'rk');

    await tester.tap(find.byType(ElevatedButton).at(0));
    await tester.pumpAndSettle();

    expect(find.text("Welcome"), findsOneWidget);
  });

  testWidgets('login test with email and password and open dashboard',
      (WidgetTester tester) async {
    when(mockAuthUsecase.loginUser('rk', 'rk'))
        .thenAnswer((_) async => Right(isLogin));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider
              .overrideWith((ref) => AuthViewModel(mockAuthUsecase)),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.loginRoute,
          routes: AppRoute.getAppRoutes(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), 'rk');
    await tester.enterText(find.byType(TextField).at(1), 'rk');

    await tester.tap(
      find.widgetWithText(ElevatedButton, 'LOG IN'),
    );

    await tester.pumpAndSettle();

    expect(find.text('Welcome Home'), findsOneWidget);
  });
}
