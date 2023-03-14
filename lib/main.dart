import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 'id1', title: 'title6', amount: 40, date: DateTime.now()),
    Transaction(id: 'id2', title: 'title6', amount: 406, date: DateTime.now()),
    Transaction(id: 'id3', title: 'title6', amount: 450, date: DateTime.now()),
    Transaction(id: 'id4', title: 'title6', amount: 540, date: DateTime.now()),
    Transaction(id: 'id5', title: 'title6', amount: 450, date: DateTime.now()),
    Transaction(id: 'id6', title: 'title6', amount: 405, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      print('clicked');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: transactions.map((tx) {
                            return SizedBox(
                                height: 70,
                                width: 300,
                                child: Card(
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 55,
                                        height: 30,
                                        // ignore: prefer_const_constructors
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.red, width: 2),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: Center(
                                            child: Text(
                                          "\$${tx.amount}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                              DateFormat().format(tx.date),
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
                                ));
                          }).toList(),
                        ),
                      ),
                    )),
              ],
            )
          ],
        ));
  }
}
