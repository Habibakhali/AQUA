class getCompaniesDate {
  bool? success;
  List<Payload>? payload;

  getCompaniesDate({this.success, this.payload});

  getCompaniesDate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['payload'] != null) {
      payload = <Payload>[];
      json['payload'].forEach((v) {
        payload!.add(new Payload.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.payload != null) {
      data['payload'] = this.payload!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payload {
  int? id;
  String? name;
  String? email;
  String? address;
  String? type;

  Payload({this.id, this.name, this.email, this.address, this.type});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['type'] = this.type;
    return data;
  }
}
