import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPerOfTotal;

  const ChartBar(
      {super.key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPerOfTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 20,
            child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 80,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPerOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.green[900]!,
                        Colors.green[800]!,
                        Colors.green[700]!,
                        Colors.green[600]!,
                        Colors.green[500]!,
                      ]),
                      borderRadius: BorderRadius.circular(2)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
