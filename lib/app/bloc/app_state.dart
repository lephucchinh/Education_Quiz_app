part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState._();

  const AppState.initial();


  AppState copyWith() {
    return AppState._(
    );
  }

  @override
  List<Object?> get props => [];
}