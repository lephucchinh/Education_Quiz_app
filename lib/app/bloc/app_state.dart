part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState._({required this.success});

  const AppState.initial({
    this.success = false,
  });

  final bool success;

  AppState copyWith({bool? success}) {
    return AppState._(success: success ?? this.success);
  }

  @override
  List<Object?> get props => [success];
}
