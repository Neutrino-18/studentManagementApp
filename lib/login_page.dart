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

  void _validateLogin(String email, String rollno) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      ref.read(loginProvider.notifier).updateLogin(email, rollno);
    }

    final whatUser = await ref.read(loginProvider.notifier).loginUser(ref);

    if (!context.mounted) return;
    if (whatUser == 'student') {
      Navigator.pushReplacementNamed(context, '/studentHome');
    } else if (whatUser == 'tpo') {
      Navigator.pushReplacementNamed(context, '/tpoHome');
    } else if (whatUser == 'instructor') {
      Navigator.pushReplacementNamed(context, '/instructorHome');
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid Credentials")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
              Theme.of(context).colorScheme.secondary
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            color: Theme.of(context).colorScheme.background,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.69),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 24),
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
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your college email";
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: Theme.of(context).textTheme.bodyLarge,
                            hintText: "Enter your college email",
                            hintStyle: Theme.of(context).textTheme.bodyMedium,
                            border: const OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your college roll number";
                            }
                            return null;
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Enter your roll no.",
                            hintStyle: Theme.of(context).textTheme.bodyMedium,
                            labelText: "Password",
                            labelStyle: Theme.of(context).textTheme.bodyLarge,
                            border: const OutlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.background)),
                      onPressed: () {
                        _validateLogin(emailController.text.trimRight(),
                            passwordController.text.trimRight());
                      },
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




// isLoading
//                           ? null
//                           : () async {
//                               ref.read(loginProvider.notifier).state = true;
//                               await Future.delayed(const Duration(seconds: 2));
//                               ref.read(loginProvider.notifier).state = false;
//                             },
//                       child: isLoading
//                           ? const CircularProgressIndicator(color: Colors.white)
//                           : const Text("Login"),