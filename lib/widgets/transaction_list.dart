import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

                        trailing: MediaQuery.of(context).size.width > 450 ? 
                        TextButton.icon (
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          },
                            icon: const Icon(Icons.delete),
                            label: Text("Delete"),
                            style: TextButton.styleFrom(
                              primary: Colors.red
                            ),
                            
                          // textColor: Colors.red[300],
                        )  
                        :IconButton(
                          onPressed: (){
                            deleteTx(transactions[index].id);
                          },
                          icon: const Icon(Icons.delete)),
                          iconColor: Colors.red,
                  ),
                );
              },
            ),
    );
  }
}
