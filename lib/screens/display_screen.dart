import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import '../database/firestore.dart';
import 'colors.dart';
import 'table.dart';

class DisplayScreen extends StatefulWidget {
  final String title;
  DisplayScreen({required this.title});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  DateTime dateTimePikerDate = DateTime.now();
  TextStyle? tableFont = const TextStyle(fontSize: 30);

  @override
  Widget build(BuildContext context) {
    //diplaying from database
    return StreamBuilder(
        stream: getCarsServcesPerDay(dateTimePikerDate),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: whiteGreen,
              body: Center(
                child: Text(
                  'Watting',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }
          if (snapshot.hasData) {
            return Container(
              color: whiteGreen,
              child: SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(this.widget.title),
                  ),
                  backgroundColor: whiteGreen,
                  body: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DateTimePicker(
                            initialValue: dateTimePikerDate.toString(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            dateLabelText: 'Date',
                            onChanged: (value) {
                              dateTimePikerDate = DateTime.parse(value);
                              setState(() {
                                dateTimePikerDate;
                              });
                            },
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()),
                            // this row for making the display arrengment
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Cost',
                                  style: TextStyle(fontSize: 30),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 100,
                                ),
                                Text(
                                  'Car Title',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                          //this list to display the content from Firebase
                          ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) =>
                                Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 30),
                                    Text(
                                      ''
                                      '${snapshot.data![index].carCost}',
                                      style: tableFont,
                                    ),
                                    const SizedBox(width: 130),
                                    Text(
                                      '${snapshot.data![index].carTitle}',
                                      style: tableFont,
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: black,
                                  height: 2,
                                  thickness: 2,
                                )
                              ],
                            ),
                            itemCount: snapshot.data!.length,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

          return Scaffold();
        });
  }
}
