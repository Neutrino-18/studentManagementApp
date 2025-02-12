import 'package:app_crt/Modals/login.dart';
import 'package:app_crt/Providers/login_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final _email = emailController.text;
    final _rollno = passwordController.text;

    void _validateLogin(String email, String rollno) {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();

        ref.watch(loginProvider.notifier).updateEmail(email, rollno);
      }
    }

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
                      onPressed: () {
                        // print(emailController.text);
                        // print(passwordController.text);
                        _validateLogin(_email, _rollno);
                      },
                      child: const Text("Login"),
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