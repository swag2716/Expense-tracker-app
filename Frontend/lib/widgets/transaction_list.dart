import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList({super.key, required this.transactions, required this .deleteTx});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
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
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ]),
            );
          })
          
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(deleteTx: deleteTx, transaction: transactions[index]);
              },
            ),
    );
  }
}
