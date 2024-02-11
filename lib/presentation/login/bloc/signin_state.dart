class SignInState {
  final String? email;
  final String? password;
  const SignInState({this.email, this.password});

  SignInState copyWith({String? email, String? passward}) {
    return SignInState(
        email: email ?? this.email,
         password: password ?? this.password);
  }
}
