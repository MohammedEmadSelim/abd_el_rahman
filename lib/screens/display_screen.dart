import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../database/firestore.dart';
import 'colors.dart';
import 'table.dart';


class DisplayScreen extends StatelessWidget {
  final String title;
  DisplayScreen({required this.title});
  @override
  Widget build(BuildContext context) {
    //diplaying from database
    return StreamBuilder(
        stream: getCarsServcesPerDay(),
        builder: (BuildContext context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Scaffold(
              backgroundColor: whiteGreen,
              body: Center(
                child: Text('Watting',
                style: TextStyle(fontSize: 20),),
              ),
            );
          }
          if (snapshot.hasData) {
           
            return Container(
              color: whiteGreen,
              child: SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(this.title),
                  ),
                  backgroundColor: whiteGreen,
                  body: Padding(
                    padding: const EdgeInsets.all(20),
                    child: displayTable(snapshot.data!),
                  ),
                ),
              ),
            );
          }

          return Scaffold();
        });
  }
}
