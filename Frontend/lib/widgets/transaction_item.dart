import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/controllers/transaction_controller.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
    final TransactionController _transactionController = Get.find<TransactionController>();

  final Transaction transactionItem;

  TransactionItem({super.key, required this.transactionItem});

  void deleteTx(transactionId) async{
    try{
      await _transactionController.deleteTransaction(transactionId);
    } catch(e){
      print(e);
      Get.snackbar("error","Failed to delete transaction");
    }
  }

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
                            '\$${transactionItem.amount.toString()}',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        )),
                      ),
                    ),
                    title: Text(
                      transactionItem.title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(transactionItem.date)
                        .toString()),

                        trailing: MediaQuery.of(context).size.width > 450 ? 
                        TextButton.icon (
                          onPressed: (){
                            deleteTx(transactionItem.id);
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
                            deleteTx(transactionItem.id);
                          },
                          icon: const Icon(Icons.delete)),
                          iconColor: Colors.red,
                  ),
                );


                
  }
}