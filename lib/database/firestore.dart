import 'package:cloud_firestore/cloud_firestore.dart';

var ref = FirebaseFirestore.instance.collection('cars');

class CarModel {
  String? carTitle;
  String? carCost;
  String? id;
  DateTime? carDatetime;

  CarModel({this.carTitle, this.carCost, this.id, this.carDatetime});

  CarModel fromMap(Map<String, dynamic> mapData) {
    return CarModel(
      carTitle: mapData['name'],
      carCost: mapData['carCost'],
      // carDatetime: mapData['date'],
    );
  }
}

//upload data function
createCarServy(
  String carCost,
  String carTitle,
  String carModle,
  String ownerPhone,
) {
  final fireStoreRef = FirebaseFirestore.instance.collection('cars');
  // int listOfCarSeervices = await getCarsServces().;
  // print(listOfCarSeervices);

  fireStoreRef.doc().set({
    'id': 1,
    'carCost': carCost,
    'name': carTitle,
    'model': carModle,
    'ownerPhone': ownerPhone,
    'date': DateTime.now()
  });
}

Stream<List<CarModel>> getCarsServcesPerDay() {
  var ref2 = ref.orderBy('date').where(
        'date',
        isEqualTo: DateTime.now(),
      );
  // .where('date', isGreaterThanOrEqualTo: DateTime.now());
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
