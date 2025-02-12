import 'package:app_crt/Modals/login.dart';
import 'package:app_crt/Repos/login_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginDetailsNotifier, LoginState>(
    (ref) => LoginDetailsNotifier());

class LoginDetailsNotifier extends StateNotifier<LoginState> {
  LoginDetailsNotifier() : super(LoginState(email: '', rollno: ''));

  void updateEmail(String email, String rollno) {
    state = state.copywith(email: email, rollno: rollno);
  }
}

final loginApiProvider = Provider<LoginHelper>((ref) => LoginHelper());

final userIdProvider = FutureProvider<String>((ref) {
  final login = ref.watch(loginProvider);
  final email = login.email;
  final rollno = login.rollno;

  print(email);
  print(rollno);
  final loginApi = ref.watch(loginApiProvider);

  return "";
});
