import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final deleteTx;
  final transaction;

  const TransactionItem({super.key, required this.deleteTx, required this.transaction});

  @override
  Widget build(BuildContext context) {
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
                            '\$${transaction.amount.toString()}',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        )),
                      ),
                    ),
                    title: Text(
                      transaction.title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(transaction.date)
                        .toString()),

                        trailing: MediaQuery.of(context).size.width > 450 ? 
                        TextButton.icon (
                          onPressed: () {
                            deleteTx(transaction.id);
                          },
                            icon: const Icon(Icons.delete),
                            label: const Text("Delete"),
                            style: TextButton.styleFrom(
                              // ignore: deprecated_member_use
                              primary: Colors.red
                            ),
                            
                          // textColor: Colors.red[300],
                        )  
                        :IconButton(
                          onPressed: (){
                            deleteTx(transaction.id);
                          },
                          icon: const Icon(Icons.delete)),
                          iconColor: Colors.red,
                  ),
                );
  }
}