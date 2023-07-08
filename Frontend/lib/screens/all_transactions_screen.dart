import 'dart:io';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/chart.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';

class AllTransactionsScreen extends StatefulWidget {
  const AllTransactionsScreen({super.key});

  @override
  State<AllTransactionsScreen> createState() => _AllTransactionsScreen();
}

class _AllTransactionsScreen extends State<AllTransactionsScreen> {
  var _showChart = false;

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

  void _deleteTransaction(String id) {
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

  List<Widget> _buildLandscapeContent(
      MediaQueryData mediaQuery, AppBar appBar, Container txList) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Show Chart "),
          Switch.adaptive(
              value: _showChart,
              onChanged: (val) {
                setState(() {
                  _showChart = val;
                });
              })
        ],
      ),
      _showChart
          ? Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: Chart(_recentTransactions))
          : txList
    ];
  }

  List<Widget> _buildPortraitContent(
      MediaQueryData mediaQuery, AppBar appBar, Container txList) {
    return [
      Container(
          height: (mediaQuery.size.height -
                  appBar.preferredSize.height -
                  mediaQuery.padding.top) *
              0.25,
          child: Chart(_recentTransactions)),
      SizedBox(
        height: mediaQuery.size.height * 0.05,
      ),
      txList
    ];
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
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
    );
    final txList = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: TransactionList(
          transactions: _userTransactions,
          deleteTx: _deleteTransaction,
        ));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (isLandscape)
                ..._buildLandscapeContent(mediaQuery, appBar, txList)
              else
                ..._buildPortraitContent(mediaQuery, appBar, txList)
            ]),
      ),
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              backgroundColor: Colors.grey[850],
              child: const Icon(Icons.add),
            ),
    );
  }
}