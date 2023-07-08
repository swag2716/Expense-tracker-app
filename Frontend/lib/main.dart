import 'package:flutter/material.dart';
import 'package:personal_expenses_app/screens/all_transactions_screen.dart';
import 'package:personal_expenses_app/screens/home_screen.dart';
import 'package:personal_expenses_app/screens/log_in_screen.dart';
import 'package:personal_expenses_app/screens/sign_up_screen.dart';
import 'package:personal_expenses_app/utils/theme_widget.dart';




void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: MyAppTheme.darkTheme,
      home: const AllTransactionsScreen()
      );
      
  
  }
}


