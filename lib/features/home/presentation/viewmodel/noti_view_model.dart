import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/use_case/noti_use_case.dart';
import '../state/noti_state.dart';

final notiViewModelProvider =
    StateNotifierProvider<NotiViewModel, NotiState>((ref) {
  return NotiViewModel(
    ref.read(notiUseCaseProvider),
  );
});

class NotiViewModel extends StateNotifier<NotiState> {
  final NotiUseCase _notiUseCase;

  NotiViewModel(this._notiUseCase) : super(NotiState.initial()) {
    getNoti();
  }

  Future<void> addNoti(String noti, String userId) async {
    state = state.copyWith(isLoading: true);
    var data = await _notiUseCase.addNoti(noti, userId);
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

  getNoti() async {
    state = state.copyWith(isLoading: true);
    var data = await _notiUseCase.getNoti();
    data.fold(
      (l) => state = state.copyWith(
        isLoading: false,
        error: l.error,
      ),
      (r) => {
        state = state.copyWith(
          isLoading: false,
          error: null,
          notis: r,
        ),
      },
    );
  }
     Future<void>  clearNoti() async {
    state = state.copyWith(isLoading: true);
    var data = await _notiUseCase.clearNoti();
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
