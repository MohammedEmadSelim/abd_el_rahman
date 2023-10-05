class CarModel {
  String? carTitle;
  String? carCost;
  String? id;
  DateTime? carDate;
  num? fixerMoney;
  String? carOnwerName;
  String? describtion;

  CarModel(
      {this.carTitle,
      this.carCost,
      this.id,
      this.carDate,
      this.fixerMoney,
      this.carOnwerName,
      this.describtion});

  CarModel fromMap(Map<String, dynamic> mapData) {
    return CarModel(
      carTitle: mapData['name'],
      carCost: mapData['carCost'],
      carDate: DateTime.parse(mapData['date']),
      fixerMoney: mapData['fixerCost'],
      carOnwerName: mapData['carOwnerName'],

    );
  }
}
//     'id': 1,
//     'carCost': carCost,
//     'fixerCost': int.parse(fixerCost),
//     'name': carTitle,
//     'model': carModle,
//     'ownerPhone': ownerPhone,
//     'carOwnerName': carOwnerName,
//     'describtion': describtion,
//     'date': DateTime.now();