import 'package:bytebank2/models/transaction.dart';
import 'package:flutter/material.dart';

import 'http/webclient.dart';
import 'models/contact.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(Bytebank2App());
  save(Transaction(500, Contact(0, 'Helen', 2000))).then((transaction) => print(transaction));
//      findAll().then((transactions) => print('new transactions $transactions'));
  //save(Contact(0, 'Helen', 2000));
  //findAll().then((contacts) => debugPrint(contacts.toString()));
}

class Bytebank2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      home: Dashboard(),
    );
  }
}