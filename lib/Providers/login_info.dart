import 'package:app_crt/Modals/login.dart';
import 'package:app_crt/Repos/login_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginDetailsNotifier, LoginState>(
    (ref) => LoginDetailsNotifier());

class LoginDetailsNotifier extends StateNotifier<LoginState> {
  LoginDetailsNotifier() : super(LoginState(email: '', rollno: '', role: ''));

  void updateLogin(String email, String rollno) {
    state = state.copywith(email: email, rollno: rollno);
  }

  Future<String> loginUser(WidgetRef ref) async {
    final loginApi = ref.read(loginApiProvider);
    final userIdAndRole = await loginApi.login(state.email!, state.rollno!);

    if (userIdAndRole.userId!.isNotEmpty && userIdAndRole.role!.isNotEmpty) {
      state = state.copywith(
          userId: userIdAndRole.userId, role: userIdAndRole.role);
      print(userIdAndRole.userId);

      if (userIdAndRole.role == 'student') {
        return 'student';
      } else if (userIdAndRole.role == 'tpo') {
        return 'tpo';
      } else if (userIdAndRole.role == 'instructor') {
        return 'instructor';
      } else {
        return '';
      }
    } else {
      return '';
    }
  }
}

final loginApiProvider = Provider<LoginHelper>((ref) => LoginHelper());
