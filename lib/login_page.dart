import 'package:app_crt/Common/Widgets/text_field.dart';
import 'package:app_crt/Common/page_footer.dart';
import 'package:app_crt/Providers/login_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> _validateLogin(String email, String rollno) async {
    debugPrint("Entered validation");
    if (formKey.currentState!.validate()) {
      debugPrint("Validated");
      formKey.currentState!.save();
      debugPrint("Saved");
      debugPrint("Reading");
      ref.read(loginProvider.notifier).updateLogin(email, rollno);
      debugPrint("Read");

      debugPrint("Starting Watching");
      await ref.read(loginProvider.notifier).loginUser(ref);
      debugPrint("Finished Watching");
      final stateRead = ref.read(loginProvider);
      debugPrint("Read Provider");
      if (stateRead.isLoggedIn) {
        debugPrint("Navigating");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const IconFooter();
        }));
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginWatcher = ref.watch(loginProvider);
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Sign In \n         To Win",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                const SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      MyTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your college email";
                          }
                          return null;
                        },
                        textEditingController: emailController,
                        labelText: "Email",
                        hintText: "Enter your college email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 12),
                      MyTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your college roll number";
                          }
                          return null;
                        },
                        textEditingController: passwordController,
                        hintText: "Enter your roll no.",
                        labelText: "Password",
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password?"),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onBackground)),
                    onPressed: () {
                      _validateLogin(emailController.text.trimRight(),
                          passwordController.text.trimRight());
                    },
                    child: loginWatcher.isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.surface),
                          ),
                  ),
                ),
                if (loginWatcher.error != null)
                  Text(
                    "Oh oh ${loginWatcher.error}.\n Check Your Internet Connection",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Theme.of(context).colorScheme.error),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
