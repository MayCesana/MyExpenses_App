import 'package:first_app/Model/Transaction.dart';
import 'package:flutter/material.dart';
import '../Model/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  
  final List<Transaction> _transactions;
  final Function deleteTx;

  TransactionsList(this._transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(radius: 30, 
              backgroundColor: const Color.fromARGB(255, 250, 209, 29),
              foregroundColor: Colors.black,

              child:Padding(
                padding: const EdgeInsets.all(6),
                child: FittedBox(
                  child: Text('₪${_transactions[index].amount.toStringAsFixed(2)}',)
                ),
              )),
              title: Text(_transactions[index].title, style: 
                     const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              subtitle: Text(DateFormat.yMMMd('en_US').format(_transactions[index].date),),
              trailing: IconButton(
                icon: const Icon(Icons.delete), 
                color: const Color.fromARGB(255, 255, 49, 49),
                onPressed: () => deleteTx(_transactions[index].id), 
                iconSize: 18.0,
                ),
            ),
          );
        },
        itemCount: _transactions.length, 


      ),
    );
  }
}
      
          //children: _transactions.map((tx) {
          //return Card(
            //child: Row(
            //children: <Widget>[
             // Container(
                //margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //decoration: BoxDecoration(
                //border: Border.all(color: const Color.fromARGB(255, 250, 209, 29), width: 2)),
               // padding: const EdgeInsets.all(10),
                //child: Text('₪${tx.amount.toStringAsFixed(2)}',
                 //  style: const TextStyle(
                   //fontWeight: FontWeight.bold, fontSize: 20, color:Colors.grey),
                  //),
                //), //amount box
              //Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                //children: [
                  //Text(tx.title,
                    //style: 
                     //const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  //Text(DateFormat.yMMMd('en_US').format(tx.date),
                 //   style:
                      //const TextStyle(fontWeight: FontWeight.normal, color:Colors.grey)),
                //  ],)
                //],
            //  ),
       //   );
  //      }).toList(),),
   //   )
    //);
  
