class LoginState {
  LoginState({
    this.email,
    this.rollno,
    this.role,
    this.userId,
    // this.isLoggedIn = false
  });

  final String? email;
  final String? rollno;
  final String? role;
  final String? userId;
  // final bool isLoggedIn;

  LoginState copywith({
    String? email,
    String? rollno,
    String? userId,
    String? role,
    // bool? isLoggedIn
  }) {
    return LoginState(
      email: email ?? this.email,
      rollno: rollno ?? this.rollno,
      role: role ?? this.role,
      userId: userId ?? this.userId,
      // isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  factory LoginState.fromJson(Map<String, dynamic> json) {
    return LoginState(userId: json['user_id'], role: json['role']);
  }
}
