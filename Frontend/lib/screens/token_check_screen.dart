import 'package:flutter/material.dart';
import 'package:personal_expenses_app/controllers/is_user_logged_in.dart';
import 'package:personal_expenses_app/screens/all_transactions_screen.dart';
import 'package:personal_expenses_app/screens/log_in_screen.dart';
import 'package:personal_expenses_app/screens/sign_up_screen.dart';

import '../controllers/transaction_controller.dart';

class TokenCheckScreen extends StatelessWidget{
  const TokenCheckScreen({super.key});

  @override
  Widget build(BuildContext context){
    final TransactionController transactionController = TransactionController();
    return FutureBuilder<TokenStatus>(
      future: transactionController.isUserLoggedIn(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else{
          final TokenStatus tokenStatus = snapshot.data ?? TokenStatus.valid;
          if(tokenStatus == TokenStatus.valid){
            return const AllTransactionsScreen();
          }
          else if(tokenStatus == TokenStatus.accessTokenExpired){
            return const AllTransactionsScreen();
          } 
          else if(tokenStatus == TokenStatus.refreshTokenExpired){
            return LogInScreen();
          }
          else if(tokenStatus == TokenStatus.newUser){
            return SignUpScreen();
          } else{
            throw Exception("invalid request");
          }

        }
      },
    );
  }
}