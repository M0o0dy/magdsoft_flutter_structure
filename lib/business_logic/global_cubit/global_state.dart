part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class LoginLoadingState extends GlobalState {}

class LoginSuccessState extends GlobalState {
  final AccountModel accountModel;
  LoginSuccessState(this.accountModel);
}

class LoginErrorState extends GlobalState {
  final String error;
  LoginErrorState(this.error);
}

class LoginVisibilityState extends GlobalState {}

class RegisterLoadingState extends GlobalState {}

class RegisterSuccessState extends GlobalState {
  final AccountModel accountModel;
  RegisterSuccessState(this.accountModel);
}

class RegisterErrorState extends GlobalState {
  final String error;
  RegisterErrorState(this.error);
}
class RegisterVisibilityState extends GlobalState {}

class ChangeToEnLangState extends GlobalState {}

class ChangeToArLangState extends GlobalState {}

class ErrorChangeLangState extends GlobalState {}

class ChangeViewState extends GlobalState {}