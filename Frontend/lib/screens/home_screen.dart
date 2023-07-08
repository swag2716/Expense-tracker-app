import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Welcome!", style: Theme.of(context).textTheme.displayLarge,),
          )
        ]
      ),
    );
  }
}