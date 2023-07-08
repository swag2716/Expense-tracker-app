import 'package:flutter/material.dart';

import '../widgets/textfield_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const TextFieldWidget(hintText: "Email"),
                    const SizedBox(
                      height: 24,
                    ),
                    const TextFieldWidget(hintText: "Password"),
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
                          onPressed: () {},
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
