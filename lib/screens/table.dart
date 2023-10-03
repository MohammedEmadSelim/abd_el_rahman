import 'package:abd_el_rahman/screens/write_screen.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import '../database/firestore.dart';
import 'colors.dart';

// drawing table
class displayTable extends StatefulWidget {
  List<CarModel> listOfdata;

  displayTable(this.listOfdata, {super.key});

  @override
  State<displayTable> createState() => _displayTableState();
}

class _displayTableState extends State<displayTable> {
 

  DateTime? dateTimePikerDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return
        // this container used to make safe area back ground lightGreen
        Container(
      color: whiteGreen,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: whiteGreen,
          
        ),
      ),
    );
  }
}
