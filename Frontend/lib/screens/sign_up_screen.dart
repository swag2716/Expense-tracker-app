import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expenses_app/controllers/auth_controller.dart';
import 'package:personal_expenses_app/models/auth_model.dart';
import 'package:personal_expenses_app/screens/all_transactions_screen.dart';
import 'package:personal_expenses_app/screens/loading_screen.dart';
import 'package:personal_expenses_app/screens/log_in_screen.dart';
import '../widgets/textfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 100),
          color: Colors.black,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Manage and \nVisualize\nYour',
                        style: Theme.of(context).textTheme.displayLarge,
                        children: const <TextSpan>[
                          TextSpan(
                              text: ' Expenses',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ],
                      ),
                    ),

                    // Image.asset("asset/images/leave.png"),
                  ],
                ),
                Column(
                  children: [
                    TextFieldWidget(
                      hintText: "Name",
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFieldWidget(
                      hintText: "Email",
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFieldWidget(
                      hintText: "Phone number",
                      controller: phoneController,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFieldWidget(
                      obscureText: true,
                      hintText: "Password",
                      controller: passwordController,
                    ),
                  ],
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(colors: [
                            Colors.green[900]!,
                            Colors.green[800]!,
                            Colors.green[700]!,
                            Colors.green[600]!,
                            Colors.green[500]!,
                          ])),
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () async {
                            AuthModel user = AuthModel(
                                id: "",
                                name: nameController.text,
                                email: emailController.text,
                                phoneNumber: phoneController.text,
                                password:passwordController.text,
                                token: "",
                                refreshToken: "",
                                userId: ""
                              );

                            try {
                              await _authController.signUp(user);

                              Get.offAll(
                                () => const LoadingScreen(),
                                transition: Transition.fade,
                                duration: const Duration(seconds: 1),
                              );
                            } catch (e) {
                              log.printError();
                            }
                          },
                          child: Center(
                              child: Text(
                            "Sign Up",
                            style: Theme.of(context).textTheme.displaySmall,
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                    [
                      Text('Already have an account?', style: Theme.of(context).textTheme.displaySmall),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(LogInScreen(),
                            transition: Transition.fade,
                            duration: const Duration(seconds: 1),
                          );
                        },
                        child: const Text(
                          'Log In',
                           style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                           ),
                        ),
                      )
                    ]
                    ),
                    
                    
                    
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
