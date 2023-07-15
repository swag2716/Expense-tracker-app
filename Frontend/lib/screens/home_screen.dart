import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expenses_app/screens/loading_screen.dart';
import 'package:personal_expenses_app/screens/log_in_screen.dart';
import 'package:personal_expenses_app/screens/sign_up_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        Container(
            width: size.width,
            height: size.height,
            color: Colors.black,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 120, bottom: 40),
                    child: RichText(
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
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 80, right: 80),
                    child: Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          // width: 120,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                            onPressed: () async {
                              Get.to(SignUpScreen(), transition: Transition.fade, duration: const Duration(seconds: 1));
                  
                              
                            },
                            child: Center(
                                child: Text(
                              "Sign Up",
                              style: Theme.of(context).textTheme.displaySmall,
                            )),
                          ),
                        ),
                      ),
                  
                      const SizedBox(height: 30,),
                  
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
                          // width: 120,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                            onPressed: () async {
                              Get.to(LogInScreen(), transition: Transition.fade, duration: const Duration(seconds: 1));
                  
                              
                            },
                            child: Center(
                                child: Text(
                              "Log In",
                              style: Theme.of(context).textTheme.displaySmall,
                            )),
                          ),
                        ),
                      ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 0,
                    ),
                    // margin: const EdgeInsets.only(top: 0),
                    alignment: Alignment.bottomCenter,
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height / 2.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.cover,
                            image: AssetImage("asset/images/home.jpg"))),
                  ),
                ]))
      ]),
    );
  }
}
