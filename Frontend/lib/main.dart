import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expenses_app/controllers/auth_controller.dart';
import 'package:personal_expenses_app/screens/all_transactions_screen.dart';
import 'package:personal_expenses_app/screens/home_screen.dart';
import 'package:personal_expenses_app/screens/log_in_screen.dart';
import 'package:personal_expenses_app/screens/sign_up_screen.dart';
import 'package:personal_expenses_app/utils/theme_widget.dart';

import 'screens/token_check_screen.dart';




void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final AuthController authController = Get.put(AuthController());
  MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: MyAppTheme.darkTheme,
      home: const TokenCheckScreen()
    );
      
  
  }
}


