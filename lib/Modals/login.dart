import 'package:app_crt/Common/Constants/names.dart';

class LoginState {
  LoginState({
    this.email = '',
    this.rollno = '',
    this.role = '',
    this.userId = '',
    this.isLoggedIn = false,
    this.isLoading = false,
    this.error,
    // this.navigationEvent,
  });

  final String email;
  final String rollno;
  final String role;
  final String userId;
  final bool isLoggedIn;
  final bool isLoading;
  String? error;
  // final Navigation? navigationEvent;

  LoginState copyWith({
    String? email,
    String? rollno,
    String? userId,
    String? role,
    bool? isLoggedIn,
    bool? isLoading,
    String? error,
    //   Navigation? navigationEvent,
  }) {
    return LoginState(
      email: email ?? this.email,
      rollno: rollno ?? this.rollno,
      role: role ?? this.role,
      userId: userId ?? this.userId,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      //   navigationEvent: navigationEvent,
    );
  }

  factory LoginState.fromJson(Map<String, dynamic> json) {
    return LoginState(userId: json['user_id'], role: json['role']);
  }
}
