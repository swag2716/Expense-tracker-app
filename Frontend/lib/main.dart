import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expenses_app/controllers/auth_controller.dart';
import 'package:personal_expenses_app/screens/loading_screen.dart';
import 'package:personal_expenses_app/utils/theme_widget.dart';
import 'controllers/transaction_controller.dart';




void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final AuthController authController = Get.put(AuthController());
  final TransactionController transactionController = Get.put(TransactionController());
  MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: MyAppTheme.darkTheme,
      home: const LoadingScreen()
    );
      
  
  }
}


