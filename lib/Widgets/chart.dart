import 'package:expenses_app/Models/transaction.dart';
import 'package:expenses_app/Widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({super.key, required this.recentTransactions});
  List<Map<String, Object>> get groupedTransactionsValues {
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
      return {
        'Day': DateFormat.E().format(weekDay).substring(0, 1),
        'Amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransactionsValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['Amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionsValues.map((index) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  label: index['Day'] as String,
                  spendingAmount: index['Amount'] as double,
                  spendingPctOfTotal: totalSpending == 0.0
                      ? 0.0
                      : (index['Amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
