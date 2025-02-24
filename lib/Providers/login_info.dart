import 'package:app_crt/Common/Constants/names.dart';
import 'package:app_crt/Modals/login.dart';
import 'package:app_crt/Repos/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginDetailsNotifier, LoginState>(
    (ref) => LoginDetailsNotifier());

class LoginDetailsNotifier extends StateNotifier<LoginState> {
  LoginDetailsNotifier() : super(LoginState());

  /* Update the login details */
  void updateLogin(String email, String rollno) {
    state = state.copyWith(email: email, rollno: rollno);
  }

  /* Login the user and navigating to the respective home screen */
  Future<void> loginUser(WidgetRef ref, BuildContext context) async {
    state = state.copyWith(isLoading: true, error: null, navigationEvent: null);
    final loginApi = ref.read(loginApiProvider);
    try {
      final userIdAndRole = await loginApi.login(state.email, state.rollno);

      if (userIdAndRole.role == "none") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Invalid Credentials")));
      }

      if (userIdAndRole.userId.isNotEmpty && userIdAndRole.role.isNotEmpty) {
        state = state.copyWith(
            userId: userIdAndRole.userId,
            role: userIdAndRole.role,
            isLoggedIn: true);
        print("The id inside the provider is : ${userIdAndRole.userId}");

        switch (userIdAndRole.role) {
          case NavigationConsts.studentRole:
            break;
          case NavigationConsts.tpoRole:
            break;
          case NavigationConsts.instructorRole:
            break;

          default:
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Invalid Credentials")));
            break;
        }
      } else {
        throw Exception("Invalid Credentials");
      }
    } catch (e) {
      state =
          state.copyWith(isLoading: false, error: "Error with login is: $e");
    }
  }

  void clearNavigationEvent() {
    state = state.copyWith(navigationEvent: null);
  }
}

/* Provider for the login fetcher */
final loginApiProvider = Provider<LoginHelper>((ref) => LoginHelper());
