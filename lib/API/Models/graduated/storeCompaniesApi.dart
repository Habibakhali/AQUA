class StoreCompanies {
  String? message;
  Errors? errors;
  bool? success;
  Payload? payload;

  StoreCompanies({this.success, this.payload});

  StoreCompanies.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
    success = json['success'];
    payload =
    json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();}
    data['success'] = this.success;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    return data;
  }
}
  class Errors {
  List<String>? name;

  Errors({this.name});

  Errors.fromJson(Map<String, dynamic> json) {
  name = json['name'].cast<String>();
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['name'] = this.name;
  return data;
  }
  }

class Payload {
  String? name;
  String? email;
  String? address;
  String? type;
  int? id;

  Payload({this.name, this.email, this.address, this.type, this.id});

  Payload.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address = json['address'];
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['type'] = this.type;
    data['id'] = this.id;
    return data;
  }
}