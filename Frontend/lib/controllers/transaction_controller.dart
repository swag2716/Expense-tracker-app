import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/screens/log_in_screen.dart';
import 'package:personal_expenses_app/screens/sign_up_screen.dart';
import '../storage/auth_storage.dart';



class TransactionController extends GetxController {
  RxList<Transaction> transactions = <Transaction>[].obs;

  Future<void> getTransactions() async {
  String url = "http://192.168.29.116:9000/transaction";
  final tokenManager = TokenManager();
  final accessToken = await tokenManager.getAccessToken();
  final refreshToken = await tokenManager.getRefreshToken();
  final response = await http.get(
    Uri.parse(url), 
    headers: {
      'token': 'Bearer $accessToken',
      'refresh-token': '$refreshToken',
    }
  );

  if(response.statusCode == 200){
    final jsonData = jsonDecode(response.body) as List<dynamic>?;
    if(jsonData != null){
      transactions.assignAll(jsonData.map((data) => Transaction.fromJSON(data)).toList());
    }
  }

  else if(response.statusCode == 401){
    Get.to(LogInScreen());
  } 
  else if(response.statusCode == 400){
    Get.to(SignUpScreen());
  }
  else{
    throw Exception("Failed to check validity");
  }
}




  Future<void> editTransaction(Transaction transaction) async {
    try {
      final response = await http.patch(
        Uri.parse('http://192.168.29.116:9000/transaction/${transaction.id}'),
        body: jsonEncode(transaction.toJSON()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final index = transactions.indexWhere((t) => t.id == transaction.id);
        if (index != -1) {
          transactions[index] = transaction;
        }
      } else {
        throw Exception('Failed to edit task');
      }
    } catch (e) {
      throw Exception('Failed to edit task: $e');
    }
  }

  Future<void> deleteTransaction(String transactionId) async {
    try {
      final response = await http
          .delete(Uri.parse('http://192.168.29.116:8000/task/$transactionId'));
      if (response.statusCode == 200) {
        transactions.removeWhere((t) => t.id == transactionId);
      } else {
        throw Exception('Failed to delete task');
      }
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }

  Future<void> addTransaction(Transaction transaction) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.29.116:9000/transaction'),
        body: jsonEncode(transaction.toJSON()),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final createdTask = Transaction.fromJSON(jsonDecode(response.body));
        transactions.add(createdTask);
      } else {
        throw Exception('Failed to create task');
      }
    } catch (e) {
      throw Exception('Failed to create task: $e');
    }
  }
}
