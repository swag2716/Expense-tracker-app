import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/transaction_controller.dart';

class LoadingScreen extends StatefulWidget{
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final TransactionController _transactionController = Get.find<TransactionController>();

  @override
  void initState(){
    super.initState();
    _transactionController.getTransactions();
  }

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        
        child: CircularProgressIndicator(
          valueColor:AlwaysStoppedAnimation<Color>(Colors.green),
        ),
        
        ),
    );
  }
}