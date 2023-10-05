import 'package:cloud_firestore/cloud_firestore.dart';



var ref = FirebaseFirestore.instance.collection('cars');

class CarModel {
  String? carTitle;
  String? carCost;
  String? id;
  DateTime? carDatetime;
  num? fixerCost;
  String? carOwnerName;
  String? carOwnerPhone;
  String? describtion;

  CarModel({
    this.carTitle,
    this.carCost,
    this.id,
    this.carDatetime,
    this.fixerCost,
    this.carOwnerName,
    this.carOwnerPhone,
    this.describtion
  });

  CarModel fromMap(Map<String, dynamic> mapData) {
    return CarModel(
      carTitle: mapData['name'],
      carCost: mapData['carCost'],
      // carDatetime: mapData['date'],
      fixerCost: mapData['fixerCost'],
      carOwnerName: mapData['carOwnerName'],
      carOwnerPhone: mapData['ownerPhone'],
      describtion: mapData['describtion'],
    );
  }
}

//upload data function
createCarServy(
  String carCost,
  String carTitle,
  String? carModle,
  String? ownerPhone,
  String fixerCost,
  String? carOwnerName,
  String? describtion,
) {
  final fireStoreRef = FirebaseFirestore.instance.collection('cars');

  //rearrange arguments which are going to firestore
  fireStoreRef.doc().set({
    'id': 1,
    'carCost': carCost,
    'fixerCost': int.parse(fixerCost),
    'name': carTitle,
    'model': carModle,
    'carOwnerName': carOwnerName,
    'ownerPhone': ownerPhone,
    'describtion': describtion,
    'date': DateTime.now()
  });
}

Stream<List<CarModel>> getCarsServcesPerDay(DateTime date) {
  var ref2 = ref
      .orderBy('date')
      .where('date',
          isGreaterThanOrEqualTo:
              DateTime(date.year, date.month, date.day, 0, 0, 0))
      .where('date',
          isLessThanOrEqualTo:
              DateTime(date.year, date.month, date.day, 24, 0, 0));
  // .where('date', whereIn: [DateTime.now()]);
  var data = ref2.snapshots().map(
        (event) => event.docs
            .map(
              (e) => CarModel().fromMap(e.data()),
            )
            .toList(),
      );
  return data;
}

//getting data function
Stream<List<CarModel>> getCarsServces() {
  var data = ref.snapshots().map(
        (event) => event.docs
            .map(
              (e) => CarModel().fromMap(e.data()),
            )
            .toList(),
      );
  return data;
}
