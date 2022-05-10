class Kota {
  String? cityId;
  String? type;
  String? cityName;

  Kota({this.cityId, this.type, this.cityName});

  Kota.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    type = json['type'];
    cityName = json['city_name'];
  }

  @override
  String toString() => cityName as String;

  static List<Kota> fromJsonList(List list) {
    if (list.length == 0) return List<Kota>.empty();
    return list.map((item) => Kota.fromJson(item)).toList();
  }
}
