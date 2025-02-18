
import '../../domain/entity/profile_entity.dart';

class ProfileState {
  final bool isLoading;
  final List<ProfileEntity> profiles;
  final String? error;

  ProfileState({
    required this.isLoading,
    required this.profiles,
    this.error,
  });

  factory ProfileState.initial() {
    return ProfileState(
      isLoading: false,
      profiles: [],
    );
  }

  ProfileState copyWith({
    bool? isLoading,
    List<ProfileEntity>? profiles,
    String? error,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      profiles: profiles ?? this.profiles,
      error: error ?? this.error,
    );
  }
}
