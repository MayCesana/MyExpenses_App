import 'package:flutter/material.dart';

class BisCard extends StatelessWidget 
{
  final String name;
  final String city;
  final String address;
  final String phoneNumber;
  final String description;

  BisCard(this.name, this.city, this.address, this.description, this.phoneNumber);

  Widget build(BuildContext context) {
    return SizedBox(height: 300, width: 200,
      child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 30,
            
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: Text(name), //business name
                  subtitle: Text(address + ',' + city, //address
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text( //description
                    description,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    RaisedButton(
                      color: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                        },
                        
                      child: const Text('See available appoitments'
                      ), 
                    ),
                    
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('ACTION 2'),
                    ),
                  ],
                ),
                Image.asset('assets/images/pic.jpg',
                height: 120, width: 400),
                ],
            ),
          )
    );
  }
}
