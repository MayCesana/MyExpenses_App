import 'package:first_app/Widgets/ChartBar.dart';

import '../Model/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {

      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      for(var i = 0; i < recentTransactions.length; ++i)
      {
        if(recentTransactions[i].date.day == weekDay.day && 
         recentTransactions[i].date.month == weekDay.month &&
         recentTransactions[i].date.year == weekDay.year)
        {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
       'day': DateFormat.E().format(weekDay),
       'amount': totalSum};
    });
  }

  double get totalSpending {
    
    return groupedTransactionsValues.fold(0.0, (sum, item) {
      if(item['amount'] != null) {
        double amt = double.parse(item['amount'].toString());
        return (sum + amt);
      }
      else 
        return 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        Card(
          elevation:  6, 
          margin: const EdgeInsets.all(20),
          child:
            Padding(padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: 
                  groupedTransactionsValues.map((data)
                  {
                    return Flexible(fit:FlexFit.tight,
                    child: ChartBar(
                      data['day'].toString(),
                      data['amount'] as double,
                      totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending
                      ),
                    );
                  }).toList(),
                ),
            ),
        ),
        Container(
              width: double.infinity,
              child: 
                Card(
                  child: 
                    Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.money),
                        title: const Text('סה"כ הוצאות'),
                        subtitle: Text(
                          totalSpending.toString(),
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),),
                        //trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.add), color: Colors.black),
                        ),
                    ]
                ),
            ),),
    ]);
  }
}