import 'dart:ffi';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../database/firestore.dart';
import 'colors.dart';
import 'navBar.dart';

class DisplayScreen extends StatefulWidget {
  final String title;
  DisplayScreen({required this.title});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  DateTime dateTimePikerDate = DateTime.now();
  TextStyle? tableFont = const TextStyle(fontSize: 30);
  // used for hide widget visibilty
  List visibilty = [];
  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    int total = 0;
    int fixerTotal = 0;
    IconData iconTogle = Icons.arrow_drop_down;

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
            for (int i = 0; i < snapshot.data!.length; i++) {
              visibilty.add(false);
            }
            //calculate total cost in one day
            for (int i = 0; i < snapshot.data!.length; i++) {
              total += int.parse(snapshot.data![i].carCost!);
              fixerTotal += (snapshot.data![i].fixerCost ?? 0).toInt();
            }
            return Container(
              color: whiteGreen,
              child: SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(widget.title),
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
                              setState(() {
                                dateTimePikerDate = DateTime.parse(value);
                                // dateTimePikerDate;
                                // total = 0;
                              });
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${snapshot.data![index].carCost}',
                                      style: tableFont,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 160,
                                          child: Column(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${snapshot.data![index].carTitle}',
                                                style: tableFont,
                                              ),
                                              Text(
                                                  '${snapshot.data![index].carOwnerName}'),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                        
                                              setState(() {
                                                visibilty[index] =
                                                    !visibilty[index];
                                                iconTogle = Icons.arrow_drop_up;
                                              });
                                            },
                                            icon: Icon(
                                              iconTogle,
                                              size: 30,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                                Visibility(
                                  visible: visibilty[index],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      // color: white,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  launchUrl(Uri.parse(
                                                      'tel:+2${snapshot.data![index].carOwnerPhone}'));
                                                },
                                                child: Text(
                                                  '${snapshot.data![index].carOwnerPhone}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const Text(
                                                'Customer Phone',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${snapshot.data![index].describtion}',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Text(
                                                'Discribtion',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(
                                  color: black,
                                  height: 2,
                                  thickness: 2,
                                ),
                              ],
                            ),
                            itemCount: snapshot.data!.length,
                          ),
                          const Divider(
                            color: black,
                            height: 2,
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$total ',
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$fixerTotal ',
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Fixer Total',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
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
