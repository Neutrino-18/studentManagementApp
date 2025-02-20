import 'package:app_crt/Common/Constants/names.dart';
import 'package:app_crt/Modals/login.dart';
import 'package:app_crt/Repos/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginDetailsNotifier, LoginState>(
    (ref) => LoginDetailsNotifier());

class LoginDetailsNotifier extends StateNotifier<LoginState> {
  LoginDetailsNotifier() : super(LoginState(email: '', rollno: '', role: ''));

  void updateLogin(String email, String rollno) {
    state = state.copywith(email: email, rollno: rollno);
  }

  void loginUser(WidgetRef ref, BuildContext context) async {
    final loginApi = ref.read(loginApiProvider);
    final userIdAndRole = await loginApi.login(state.email!, state.rollno!);

    if (userIdAndRole.userId!.isNotEmpty && userIdAndRole.role!.isNotEmpty) {
      state = state.copywith(
          userId: userIdAndRole.userId, role: userIdAndRole.role);
      print(userIdAndRole.userId);

      switch (userIdAndRole.role) {
        case Navigation.student:
          Navigator.pushReplacementNamed(context, Destination.studentHome);
          break;
        case Navigation.tpo:
          Navigator.pushReplacementNamed(context, Destination.tpoHome);
          break;
        case Navigation.instructor:
          Navigator.pushReplacementNamed(context, Destination.instructorHome);
          break;
        case Navigation.editor:
          Navigator.pushReplacementNamed(context, Destination.tpoHome);
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //   content: Text("Editor Dashboard in progress"),
          //   duration: Duration(seconds: 3),
          // ));
          break;

        default:
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Invalid Credentials")));
          break;
      }
    }
  }
}

final loginApiProvider = Provider<LoginHelper>((ref) => LoginHelper());
