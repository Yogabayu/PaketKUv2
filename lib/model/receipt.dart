class Receipt {
  int? status;
  String? message;
  GetData? data;

  Receipt({this.status, this.message, this.data});

  Receipt.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new GetData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GetData {
  Summary? summary;
  Detail? detail;
  List<History>? history;

  GetData({this.summary, this.detail, this.history});

  GetData.fromJson(Map<String, dynamic> json) {
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    detail =
        json['detail'] != null ? new Detail.fromJson(json['detail']) : null;
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(new History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    if (detail != null) {
      data['detail'] = detail!.toJson();
    }
    if (history != null) {
      data['history'] = history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summary {
  String? awb;
  String? courier;
  String? service;
  String? status;
  String? date;
  String? desc;
  String? amount;
  String? weight;

  Summary(
      {this.awb,
      this.courier,
      this.service,
      this.status,
      this.date,
      this.desc,
      this.amount,
      this.weight});

  Summary.fromJson(Map<String, dynamic> json) {
    awb = json['awb'];
    courier = json['courier'];
    service = json['service'];
    status = json['status'];
    date = json['date'];
    desc = json['desc'];
    amount = json['amount'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['awb'] = awb;
    data['courier'] = courier;
    data['service'] = service;
    data['status'] = status;
    data['date'] = date;
    data['desc'] = desc;
    data['amount'] = amount;
    data['weight'] = weight;
    return data;
  }
}

class Detail {
  String? origin;
  String? destination;
  String? shipper;
  String? receiver;

  Detail({this.origin, this.destination, this.shipper, this.receiver});

  Detail.fromJson(Map<String, dynamic> json) {
    origin = json['origin'];
    destination = json['destination'];
    shipper = json['shipper'];
    receiver = json['receiver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['origin'] = origin;
    data['destination'] = destination;
    data['shipper'] = shipper;
    data['receiver'] = receiver;
    return data;
  }
}

class History {
  String? date;
  String? desc;
  String? location;

  History({this.date, this.desc, this.location});

  History.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    desc = json['desc'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['desc'] = desc;
    data['location'] = location;
    return data;
  }
}
