import 'package:abd_el_rahman/screens/display_screen.dart';
import 'package:abd_el_rahman/screens/navBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

import '../database/firestore.dart';
import 'colors.dart';

//upload data to database
// ignore: must_be_immutable
class WriteScreen extends StatefulWidget {
  final String titleApp;
  static int? selectedIndex;

  WriteScreen({super.key, required this.titleApp});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  TextEditingController carTitle = TextEditingController();

  TextEditingController carCost = TextEditingController();

  TextEditingController carModel = TextEditingController();

  TextEditingController ownermoileNumber = TextEditingController();

  TextEditingController fixerCost = TextEditingController();

  TextEditingController carOwnerName = TextEditingController();

  TextEditingController describtion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteGreen,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.titleApp,
              style: const TextStyle(fontSize: 30),
            ),
            backgroundColor: yellow,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 120,
                        child: TextField(
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
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 130,
                        child: TextField(
                          cursorColor: black,
                          controller: fixerCost,
                          decoration: InputDecoration(
                            label: const Text('Fixer Cost'),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Container(
                          width: 100,
                          child: const Text(
                            'This Section Belongs To Fixer',
                            style: TextStyle(fontSize: 15),
                          ))
                    ],
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
                      label: const Text('Car Owner Mobile Number'),
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
                    controller: carOwnerName,
                    decoration: InputDecoration(
                      label: const Text('Car Owner Name'),
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
                    cursorHeight: 40,
                    cursorColor: black,
                    controller: describtion,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 40, bottom: 40, left: 12),
                      label: const Text('Describtion'),
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
                      onPressed: () {
                        createCarServy(
                          carCost.text,
                          carTitle.text,
                          carModel.text,
                          ownermoileNumber.text,
                          fixerCost.text,
                          carOwnerName.text,
                          describtion.text,
                        );
                        // carCost.clear();
                        // carTitle.clear(); 
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          backgroundColor: whiteGreen,
        ),
      ),
    );
  }
}
