import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/auth_view_model.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: "t");
  final _passwordController = TextEditingController(text: "t");
  final _gap = const SizedBox(height: 8);
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print("INSIDE LOGIN PAGE");

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: width,
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        height: height * .19,
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Container(
                        height: height * .04,
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: const Text(
                          "Hi !",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Container(
                        height: height * .14,
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: const Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                      Container(
                        height: height * .09,
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .07,
                        width: 300,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 20), // add padding to adjust text
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            labelText: "Enter your email",
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  top: 1), // add padding to adjust icon
                              child: Icon(Icons.email),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .10,
                        width: 300,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                top: 20), // add padding to adjust text
                            isDense: true,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),

                            labelText: "Password",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(
                                  top: 1), // add padding to adjust icon
                              child: Icon(Icons.password),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .05,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              bool isLogin = await ref
                                  .read(authViewModelProvider.notifier)
                                  .loginStudent(
                                    context,
                                    _emailController.text,
                                    _passwordController.text,
                                  );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            side: BorderSide(
                                color: Colors.green.shade600, width: 1),
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          child: const Text("Login"),
                        ),
                      ),
                      SizedBox(
                        height: height * .1,
                      ),
                      const Text(
                        "OR",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: height * .1,
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {});
                              },
                              icon: const Icon(Icons.facebook),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {});
                              },
                              icon: const Icon(Icons.apple),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {});
                              },
                              icon: const Icon(Icons.telegram),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/signupRoute");
                        },
                        child: const Text(
                          "Don't have an account? Sign Up",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
