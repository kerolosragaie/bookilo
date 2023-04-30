part of 'open_url_cubit.dart';

abstract class OpenUrlState extends Equatable {
  const OpenUrlState();

  @override
  List<Object> get props => [];
}

class OpenUrlInitial extends OpenUrlState {}

class OpenUrlLoading extends OpenUrlState {}

class OpenUrlSuccess extends OpenUrlState {}

class OpenUrlFailure extends OpenUrlState {
  final String errorMessage;

  const OpenUrlFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
