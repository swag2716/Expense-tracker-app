import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Center(
              child: Column(children: [
                Container(
                  height: 400,
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
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.grey[900],
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            Colors.green[900]!,
                            Colors.green[800]!,
                            Colors.green[700]!,
                            Colors.green[600]!,
                            Colors.green[500]!,
                          ])),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        radius: 30,
                        child: FittedBox(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '\$${transactions[index].amount.toString()}',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        )),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(transactions[index].date)
                        .toString()),
                  ),
                );
              },
            ),
    );
  }
}
