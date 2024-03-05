part of 'update_coin_bloc.dart';

abstract class UpdateCoinState extends Equatable {
  const UpdateCoinState();
}

class UpdateCoinInitial extends UpdateCoinState {
  @override
  List<Object> get props => [];
}

class UploadCoinProcess extends UpdateCoinState {
  @override
  List<Object?> get props => [];
}

class UploadCoinSuccess extends UpdateCoinState {

  final String coin;

  const UploadCoinSuccess({required this.coin});

  @override
  List<Object?> get props => [coin];
}

class UploadCoinError extends UpdateCoinState {
  @override
  List<Object?> get props => [];
}
