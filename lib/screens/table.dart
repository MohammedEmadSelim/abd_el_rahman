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
  TextStyle? tableFont = const TextStyle(fontSize: 30);

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
          body: SingleChildScrollView(
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
                  itemBuilder: (BuildContext context, int index) => Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 30),
                          Text(
                            ''
                            '${widget.listOfdata[index].carCost}',
                            style: tableFont,
                          ),
                          const SizedBox(width: 130),
                          Text(
                            '${widget.listOfdata[index].carTitle}',
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
                  itemCount: widget.listOfdata.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
