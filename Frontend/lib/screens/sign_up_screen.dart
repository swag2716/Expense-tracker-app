import 'package:flutter/material.dart';
import '../widgets/textfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    TextSpan(text: '\nPersonal Expenses', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                  ],
                ),
              ),
                const Column(
                  children: [
                    // SizedBox(
                    //   height: 20,
                    // ),
                    TextFieldWidget(hintText: "Email"),
                    SizedBox(
                      height: 24,
                    ),
                    TextFieldWidget(hintText: "Phone number"),
                    SizedBox(
                      height: 24,
                    ),
                    TextFieldWidget(hintText: "Password"),
                    SizedBox(
                      height: 24,
                    ),
                    TextFieldWidget(hintText: "Confirm Password"),
                    
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
                          onPressed: () {},
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
