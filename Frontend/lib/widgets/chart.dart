import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay).substring(0, 1), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalSpending{
    return groupedTransactionValues.fold(0.0, (sum, item){
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((e){
            return Flexible(
              fit: FlexFit.loose,
              child: ChartBar(label: e['day'].toString(), spendingAmount: e['amount'] as double, spendingPerOfTotal: totalSpending==0.0 ? 0.0 : (e['amount'] as double)/totalSpending ));
          }
          ).toList(),
        ),
      ),
    );
  }
}
