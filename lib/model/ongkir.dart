class Ongkir {
  Rajaongkir? rajaongkir;

  Ongkir({this.rajaongkir});

  Ongkir.fromJson(Map<String, dynamic> json) {
    rajaongkir = json['rajaongkir'] != null
        ? new Rajaongkir.fromJson(json['rajaongkir'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rajaongkir != null) {
      data['rajaongkir'] = this.rajaongkir!.toJson();
    }
    return data;
  }
}

class Rajaongkir {
  Query? query;
  Status? status;
  OriginDetails? originDetails;
  OriginDetails? destinationDetails;
  List<Results>? results;

  Rajaongkir(
      {this.query,
      this.status,
      this.originDetails,
      this.destinationDetails,
      this.results});

  Rajaongkir.fromJson(Map<String, dynamic> json) {
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    originDetails = json['origin_details'] != null
        ? new OriginDetails.fromJson(json['origin_details'])
        : null;
    destinationDetails = json['destination_details'] != null
        ? new OriginDetails.fromJson(json['destination_details'])
        : null;
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.query != null) {
      data['query'] = this.query!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.originDetails != null) {
      data['origin_details'] = this.originDetails!.toJson();
    }
    if (this.destinationDetails != null) {
      data['destination_details'] = this.destinationDetails!.toJson();
    }
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Query {
  String? origin;
  String? destination;
  int? weight;
  String? courier;

  Query({this.origin, this.destination, this.weight, this.courier});

  Query.fromJson(Map<String, dynamic> json) {
    origin = json['origin'];
    destination = json['destination'];
    weight = json['weight'];
    courier = json['courier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['origin'] = this.origin;
    data['destination'] = this.destination;
    data['weight'] = this.weight;
    data['courier'] = this.courier;
    return data;
  }
}

class Status {
  int? code;
  String? description;

  Status({this.code, this.description});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}

class OriginDetails {
  String? cityId;
  String? provinceId;
  String? province;
  String? type;
  String? cityName;
  String? postalCode;

  OriginDetails(
      {this.cityId,
      this.provinceId,
      this.province,
      this.type,
      this.cityName,
      this.postalCode});

  OriginDetails.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    provinceId = json['province_id'];
    province = json['province'];
    type = json['type'];
    cityName = json['city_name'];
    postalCode = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['province_id'] = this.provinceId;
    data['province'] = this.province;
    data['type'] = this.type;
    data['city_name'] = this.cityName;
    data['postal_code'] = this.postalCode;
    return data;
  }
}

class Results {
  String? code;
  String? name;
  List<Costs>? costs;

  Results({this.code, this.name, this.costs});

  Results.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    if (json['costs'] != null) {
      costs = <Costs>[];
      json['costs'].forEach((v) {
        costs!.add(new Costs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    if (this.costs != null) {
      data['costs'] = this.costs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Costs {
  String? service;
  String? description;
  List<Cost>? cost;

  Costs({this.service, this.description, this.cost});

  Costs.fromJson(Map<String, dynamic> json) {
    service = json['service'];
    description = json['description'];
    if (json['cost'] != null) {
      cost = <Cost>[];
      json['cost'].forEach((v) {
        cost!.add(new Cost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service'] = this.service;
    data['description'] = this.description;
    if (this.cost != null) {
      data['cost'] = this.cost!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cost {
  int? value;
  String? etd;
  String? note;

  Cost({this.value, this.etd, this.note});

  Cost.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    etd = json['etd'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['etd'] = this.etd;
    data['note'] = this.note;
    return data;
  }
}
