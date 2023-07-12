import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expenses_app/controllers/auth_controller.dart';
import 'package:personal_expenses_app/controllers/transaction_controller.dart';
import 'package:personal_expenses_app/screens/sign_up_screen.dart';
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
  final TransactionController _transactionController = Get.find<TransactionController>();
  

  @override
  void initState(){
    super.initState();
    _transactionController.getTransactions();
  }

  var _showChart = false;
 

  List<Transaction> get _recentTransactions {
    return _transactionController.transactions.where((e) {
      return e.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }



  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: const NewTransaction(),
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
                // Get.back();
                Get.to(SignUpScreen());
              },
              icon: const Icon(Icons.home)),
        )
      ],
    );
    final txList = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: TransactionList()
      );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Obx(()=> Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (isLandscape)
                ..._buildLandscapeContent(mediaQuery, appBar, txList)
              else
                ..._buildPortraitContent(mediaQuery, appBar, txList)
            ]),
        )
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