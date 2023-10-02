class CarModel {
  String? carTitle;
  String? carCost;
  String? id;
  DateTime? carDate;

  CarModel({this.carTitle, this.carCost, this.id, this.carDate});

  CarModel fromMap(Map<String, dynamic> mapData) {
    return CarModel(
        carTitle: mapData['name'],
        carCost: mapData['carCost'],
        carDate: DateTime.parse(mapData['date']));
  }
}
