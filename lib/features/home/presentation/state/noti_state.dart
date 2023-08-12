class NotiState {
  final bool isLoading;
  final String? error;
  final List<dynamic>? notis;

  NotiState({
    required this.isLoading,
    this.error,
    this.notis,
  });

  factory NotiState.initial() {
    return NotiState(
      isLoading: false,
      error: null,
      notis: null,
    );
  }

  NotiState copyWith({
    bool? isLoading,
    String? error,
    List<dynamic>? notis,
  }) {
    return NotiState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      notis: notis ?? this.notis,
    );
  }

  @override
  String toString() =>
      'NotiState(isLoading: $isLoading, error: $error, notis: $notis)';
}
