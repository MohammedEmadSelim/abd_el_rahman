import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

import '../database/firestore.dart';
import 'colors.dart';


//upload data to database
// ignore: must_be_immutable
class WriteScreen extends StatelessWidget {
  final String titleApp;

  TextEditingController carTitle = TextEditingController();
  TextEditingController carCost = TextEditingController();
  TextEditingController carModel = TextEditingController();
  TextEditingController ownermoileNumber = TextEditingController();

  WriteScreen({super.key, required this.titleApp});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteGreen,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              titleApp,
              style: const TextStyle(fontSize: 30),
            ),
            backgroundColor: yellow,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: black,
                  controller: carCost,
                  decoration: InputDecoration(
                    label: const Text('Car Cost'),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: black,
                  controller: carTitle,
                  decoration: InputDecoration(
                    label: const Text('car title'),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: black,
                  controller: carModel,
                  decoration: InputDecoration(
                    label: const Text('car Model'),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: black,
                  controller: ownermoileNumber,
                  decoration: InputDecoration(
                    label: const Text('Owner Mobile Number'),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: FloatingActionButton(
                    // ignore: sort_child_properties_last
                    child: const Text('Add'),
                    backgroundColor: yellow,
                    onPressed: ()  {
                     
                      createCarServy(
                        carCost.text,
                        carTitle.text,
                        carModel.text,
                        ownermoileNumber.text,
                      ); // TODO
                    },
                  ),
                )
              ],
            ),
          ),
          backgroundColor: whiteGreen,
        ),
      ),
    );
  }
}
