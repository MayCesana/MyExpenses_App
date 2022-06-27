import 'dart:ui';

import 'package:flutter/material.dart';

class Transaction extends StatelessWidget 
{
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction(this.id, this.title, this.amount, this.date);

  @override
  Widget build(BuildContext context)
  {
      return SizedBox(
      
      child: Card(
      child: Column(
        children: [
            Positioned(child: 
              Container(height: 260, width: 400, decoration: const BoxDecoration(
                            image: DecorationImage(image:AssetImage('assets/images/pic.jpg'))))),
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: const Text('Tel Aviv'),
            leading: Icon(
              Icons.medical_services,
              color: Colors.purple[500],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text(
              '(408) 555-1212',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.purple[500],
            ),
          ),
          ListTile(
            title: const Text('costa@example.com'),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.purple[500],
            ),
          ),
        ],
      ),
    ),
  );
  }
}