import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/chart.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'OpenSans',
        backgroundColor: Colors.black,
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText1: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
      ),
      home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _userTransactions = [
    // Transaction(id: "t1", title: "New Top", amount: 1000, date: DateTime.now()),
    // Transaction(
    //     id: "t2", title: "New Course", amount: 500, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((e) {
      return e.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: chosenDate);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(addNewTransaction: _addNewTransaction),
          );
        });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Text("Personal Expenses"),
        ),
        // centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
                onPressed: () {
                  _startAddNewTransaction(context);
                },
                icon: const Icon(Icons.add)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Chart(_recentTransactions),
              const SizedBox(
                height: 20,
              ),
              TransactionList(transactions: _userTransactions, deleteTx: _deleteTransaction,)
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
        },
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.add),
      ),
    );
  }
}
