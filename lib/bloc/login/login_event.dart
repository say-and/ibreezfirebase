part of 'login_bloc.dart';

@immutable
class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInWithEmailPassword extends LoginEvent {
  final String email;
  final String password;

  SignInWithEmailPassword({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [password, email];
}
