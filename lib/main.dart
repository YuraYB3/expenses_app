import 'package:expenses_app/Widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'Models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];
  List<Transaction> get _recentTransactions {
    return transactions.where((element) {
      return element.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void submitData(TextEditingController titleController,
      TextEditingController amountController) {
    if (titleController.text.isEmpty || amountController.text.isEmpty) {
      return;
    }
    setState(() {
      transactions.add(Transaction(
        id: "S",
        title: titleController.text,
        amount: double.tryParse(amountController.text) ?? 0.0,
        date: DateTime.now(),
      ));
    });
    titleController.clear();
    amountController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Expensive"),
          backgroundColor: Colors.red,
          toolbarHeight: 70,
          actions: [showBottomSheet(context, submitData)],
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Chart(recentTransactions: _recentTransactions),
                spendingCard(transactions)
              ],
            )
          ],
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: showBottomSheet(context, submitData));
  }
}

SizedBox spendingCard(List transactions) {
  return SizedBox(
    height: 400,
    child: ListView(
      children: transactions.map((tx) {
        return SizedBox(
            height: 70,
            width: 300,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                elevation: 6,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //    width: 55,
                      height: 40,
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text(
                        "\$${tx.amount.toStringAsFixed(2)}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Text(
                            tx.title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: Text(
                            DateFormat('dd/MM/yyyy').format(tx.date),
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
      }).toList(),
    ),
  );
}

IconButton showBottomSheet(BuildContext context, Function submitData) {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  return IconButton(
    onPressed: () {
      showMaterialModalBottomSheet(
          context: context,
          builder: (context) => Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: 400,
                child: Column(
                  children: [
                    TextField(
                        controller: titleController,
                        onSubmitted: (_) =>
                            submitData(titleController, amountController),
                        decoration: const InputDecoration(
                            labelText: "Title",
                            labelStyle: TextStyle(color: Colors.black))),
                    TextField(
                        controller: amountController,
                        onSubmitted: (_) =>
                            submitData(titleController, amountController),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Amount",
                            labelStyle: TextStyle(color: Colors.black))),
                    TextButton(
                      onPressed: () {
                        submitData(titleController, amountController);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                      child: const Text(
                        "Click",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )));
    },
    icon: const Icon(Icons.add),
  );
}
