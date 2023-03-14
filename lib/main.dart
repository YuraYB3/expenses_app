import 'package:flutter/material.dart';

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
                const Card(
                  color: Colors.blue,
                  child: Text("CHART!!!"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: transactions.map((tx) {
                        return SizedBox(
                            height: 70,
                            width: 300,
                            child: Card(
                              color: Colors.blue,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 20,
                                    // ignore: prefer_const_constructors
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(
                                            color: Colors.white, width: 2)),
                                    child: Center(
                                        child: Text(
                                      tx.title,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 20,
                                        // ignore: prefer_const_constructors
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            border: Border.all(
                                                color: Colors.white, width: 2)),
                                        child: Center(
                                          child: Text(
                                            tx.amount.toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 60,
                                        height: 20,
                                        // ignore: prefer_const_constructors
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            border: Border.all(
                                                color: Colors.white, width: 2)),
                                        child: Center(
                                          child: Text(
                                            "${tx.date.day} ${tx.date.month}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
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
                )
              ],
            )
          ],
        ));
  }
}
