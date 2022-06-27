import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNew extends StatefulWidget
{
  final Function addTx;

  AddNew(this.addTx);

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;

  void submitDate()
  {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    
    if(enteredAmount <= 0 || enteredTitle.isEmpty || _selectedDate == null) { 
      return; 
    }
      
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2022), 
      lastDate: DateTime.now()
    ).then((pickedDate) {
      if(pickedDate == null) {return;}
      setState(() {_selectedDate = pickedDate; });
    } );


  }

  @override 
  Widget build(BuildContext context) {
    return Card(elevation: 6,
      child:Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, 
        children: <Widget> [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) => submitDate(),
            ),
          TextField(
            decoration: const InputDecoration(labelText: 'amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitDate(),
            ),
          Container(height: 70,
            child: Row(children: [
              Expanded(child: Text(_selectedDate == null ? 'No date choosen' : DateFormat.yMd().format(_selectedDate as DateTime))),
              FlatButton(
                  onPressed: _showDatePicker, 
                  child: const Text('Choose Date', style: TextStyle(fontWeight:FontWeight.bold)),
                  textColor: const Color.fromARGB(255, 250, 209, 29),),
              
              
            ],),
          ),
          Container(
            margin:const EdgeInsets.only(top: 15.0),
            child:
              RaisedButton( 
                color: const Color.fromARGB(255, 250, 209, 29),
                onPressed: submitDate,
                padding: const EdgeInsets.all(10), 
                textColor: Color.fromARGB(255, 102, 102, 102),
                child:const Text('Add', style: TextStyle(fontWeight: FontWeight.bold),),),)]),
      )
    );
  }
}