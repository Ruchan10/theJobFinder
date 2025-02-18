import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/user_hive_entity.dart';
import '../viewmodel/auth_view_model.dart';

class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
  var isObscure0 = true;
  var isObscure = true;

  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'ruchan@gmail.com');
  final _passwordController = TextEditingController(text: 'ruchan');
  final _cpasswordController = TextEditingController(text: 'ruchan');
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: width,
              child: Center(
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      Container(
                        height: height * .15,
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                          icon: const Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                      Container(
                        height: height * .05,
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
                        height: height * .10,
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: const Text(
                          "Welcome to The Job Finder",
                          style: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                      Container(
                        height: height * .07,
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: const Text(
                          "Sign Up",
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
                        height: height * .07,
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
                            labelText: "Enter password",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(
                                  top: 1), 
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
                        height: height * .10,
                        width: 300,
                        child: TextFormField(
                          controller: _cpasswordController,
                          obscureText: isObscure0,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                top: 20), // add padding to adjust text
                            isDense: true,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            labelText: "Confirm password",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(
                                  top: 1), // add padding to adjust icon
                              child: Icon(Icons.password),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscure0
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isObscure0 = !isObscure0;
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
                          key: const Key('registerButton'),
                          onPressed: () {
                            String pass = _passwordController.text;
                            String cpass = _cpasswordController.text;
                            if (pass == cpass) {
                              if (_key.currentState!.validate()) {
                                var user = UserEntity(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                ref
                                    .read(authViewModelProvider.notifier)
                                    .registerUser(user, context);

                                if (authState.error != null) {
                                  showSnackBar(
                                      message: authState.error.toString(),
                                      context: context,
                                      color: Colors.green);
                                } else {
                                  showSnackBar(
                                    message: 'Registered successfully',
                                    context: context,
                                    color: Colors.green,
                                  );
                                }
                              }
                            } else {
                              showSnackBar(
                                message: "Passwords Don't match",
                                context: context,
                                color: Colors.red,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 87, 201, 90),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          child: const Text("SIGN UP"),
                        ),
                      ),
                      SizedBox(
                        height: height * .1,
                      ),
                      
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/loginRoute");
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: "Log In",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
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
