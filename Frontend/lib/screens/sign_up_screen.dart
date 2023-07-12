import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expenses_app/controllers/auth_controller.dart';
import 'package:personal_expenses_app/models/auth_model.dart';
import 'package:personal_expenses_app/screens/all_transactions_screen.dart';
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
              const EdgeInsets.only(left: 20, right: 20, top: 150, bottom: 100),
          color: Colors.black,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hello, \nWelcome To',
                    style: Theme.of(context).textTheme.displayLarge,
                    children: const <TextSpan>[
                      TextSpan(
                          text: '\nPersonal Expenses',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    ],
                  ),
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
                                () => const AllTransactionsScreen(),
                                transition: Transition.fade,
                                duration: const Duration(seconds: 1),
                              );
                            } catch (e) {
                              Get.snackbar("error", "Failed to signup");
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
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
