import 'package:first_app/Widgets/addNew.dart';
import 'package:flutter/material.dart';
import 'Model/Transaction.dart';
import 'Widgets/transactions_list.dart';
import 'Widgets/Chart.dart';


void main() 
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title:'flutter app',
      home: MyHomePage(), 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow 
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction('0','Zara', 280, DateTime.now(),),
    Transaction('1', 'Super Pharm', 43.53, DateTime.now())
  ];

  void _addNewTransaction(String _title, double _amount, DateTime date)
  {
    final newTx = Transaction(DateTime.now().toString(),
     _title, _amount, date);

     setState(() {
       _userTransactions.add(newTx);
     });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) 
  {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddNew(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

   @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(255, 250, 209, 29),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Chart(_userTransactions),
            TransactionsList(_userTransactions, _deleteTransaction),           
          ]
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), 
        onPressed: () => _startAddNewTransaction(context), 
        backgroundColor: const Color.fromARGB(255, 250, 209, 29)
        ),
    );
  }
}

