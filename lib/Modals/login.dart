class LoginState {
  LoginState({required this.email, required this.rollno});

  final String email;
  final String rollno;

  LoginState copywith({String? email, String? rollno}) {
    return LoginState(
      email: email ?? this.email,
      rollno: rollno ?? this.rollno,
    );
  }
}
