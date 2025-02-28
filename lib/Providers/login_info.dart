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
  Future<void> loginUser(WidgetRef ref) async {
    debugPrint("Entered loginUser in Provider");
    state = state.copyWith(isLoading: true);
    debugPrint("Reading apiProvider");
    final loginApi = ref.read(loginApiProvider);
    debugPrint("Read apiProvider");
    try {
      print("Entered try Block");

      debugPrint("Entered delayed function");
      final userDetails = await loginApi.login(state.email, state.rollno);
      debugPrint("Awaited login");

      //  final Navigation? event;
      if (userDetails.userId!.isNotEmpty && userDetails.role.isNotEmpty) {
        print(
            "The id inside the provider is : ${userDetails.userId} and the role is : ${userDetails.role}");

        // switch (userDetails.role) {
        //   case NavigationConsts.studentRole:
        //     event = Navigation.student;
        //     break;
        //   case NavigationConsts.tpoRole:
        //     event = Navigation.tpo;
        //     break;
        //   case NavigationConsts.instructorRole:
        //     event = Navigation.instructor;
        //     break;

        //   default:
        //     print("Entered Default");
        //     state = state.copyWith(isLoading: false);
        //     throw Exception("Invalid Credentials");
        // }

        state = state.copyWith(
          userId: userDetails.userId,
          role: userDetails.role,
          isLoggedIn: true,
          isLoading: false,
          //  navigationEvent: event
        );
      } else {
        print("Entered else in provider");
        state = state.copyWith(isLoading: false);
        throw Exception("Invalid Credentials");
      }
    } catch (e) {
      print("Entered the catch block in provider");
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // void clearNavigationEvent() {
  //   state = state.copyWith(navigationEvent: null);
  // }
}

/* Provider for the login fetcher */
final loginApiProvider = Provider<LoginHelper>((ref) => LoginHelper());
