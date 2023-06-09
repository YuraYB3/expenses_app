import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  const ChartBar(
      {super.key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPctOfTotal});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$ ${spendingAmount.toStringAsFixed(0)}')),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
            height: 50,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20)),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            )),
        const SizedBox(
          height: 4,
        ),
        Text(label),
        const SizedBox(
          height: 4,
        )
      ],
    );
  }
}
