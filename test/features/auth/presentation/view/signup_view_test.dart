import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_job_finder/features/auth/domain/entity/user_hive_entity.dart';
import 'package:the_job_finder/features/auth/domain/use_case/auth_usecase.dart';
import 'package:the_job_finder/features/auth/presentation/view/signup_view.dart';

import '../../../../unit_test/login_unit_test.mocks.dart';

@GenerateMocks([AuthUseCase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockAuthUseCase mockAuthUsecase;
  late UserEntity authEntity;

  setUp(() {
    mockAuthUsecase = MockAuthUseCase();

    authEntity = UserEntity(
      id: null,
      email: 'rk@gmail.com',
      password: 'rk',
    );

    when(mockAuthUsecase.registerUser(authEntity))
        .thenAnswer((_) async => const Right(true));
  });

  testWidgets('signup view ...', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: SignupView(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Hi !'), findsOneWidget);
  });
  testWidgets('test registration process', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: SignupView(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byType(TextFormField).at(0), 'rk@gmail.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'rk');
    await tester.enterText(find.byType(TextFormField).at(2), 'rk');

    await tester.pumpAndSettle();

    final registerButtonFinder = find.widgetWithText(ElevatedButton, 'SIGN UP');

    await tester.tap(registerButtonFinder);
    
    await tester.pumpAndSettle();

    expect(find.text('Registered successfully'), findsOneWidget);
  });
}
