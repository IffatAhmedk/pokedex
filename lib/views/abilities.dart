import 'package:flutter/material.dart';

class Abilities extends StatelessWidget {
  const Abilities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abilities'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey.shade400,
                    offset: const Offset(0, 0),
                    spreadRadius: 5),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Monday',
                style: TextStyle(color: Colors.black),
              ),
              Row(
                children: [
                  Text(
                    '08:30',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' AM',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' - ',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    '08:30',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    ' PM',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
