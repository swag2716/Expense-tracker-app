import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expenses_app/controllers/auth_controller.dart';
import 'package:personal_expenses_app/models/auth_model.dart';

import '../widgets/textfield_widget.dart';
import 'all_transactions_screen.dart';

class LogInScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 150, bottom: 80),
          color: Colors.black,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello, \nWelcome Back",
                    style: Theme.of(context).textTheme.displayLarge),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    TextFieldWidget(hintText: "Email", controller: emailController,),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFieldWidget(
                      obscureText: true,
                      hintText: "Password", 
                      controller: passwordController,),
                    const SizedBox(
                      height: 24,
                    ),
                    Text("Forgot Password?",
                        style: Theme.of(context).textTheme.displaySmall)
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
                          onPressed: () async{
                            AuthModel user = AuthModel(
                              id: "", 
                              name: "", 
                              email: emailController.text, 
                              phoneNumber: "", 
                              password: passwordController.text,
                              token: "", 
                              refreshToken: "", 
                              userId: ""
                            );

                            try{
                              await _authController.logIn(user);

                              Get.offAll(
                                () => const AllTransactionsScreen(),
                                transition: Transition.fade,
                                duration: const Duration(seconds: 1),
                              );
                            } catch(e){
                              Get.snackbar("error", "Log in failed");
                            }
                          },
                          child: Center(
                              child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.displaySmall,
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Create Account",
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
