import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/controllers/transaction_controller.dart';
import 'package:personal_expenses_app/widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final TransactionController _transactionController = Get.find<TransactionController>();

  TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      child: _transactionController.transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints){
            return Center(
              child: Column(children: [
                Container(
                  height: constraints.maxHeight * 0.8,
                  child: Image.asset(
                    'asset/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "No Transacations are made yet!!",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ]),
            );
          })
          
          : ListView.builder(
              itemCount: _transactionController.transactions.length,
              itemBuilder: (context, index) {
                Transaction transactionItem = _transactionController.transactions[index];
                return TransactionItem(transactionItem: transactionItem);
              },
            ),
      )
    );
  }
}
