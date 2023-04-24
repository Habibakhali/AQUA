import 'package:intl/intl.dart';

class Register {
  String? message;
  Errors? errors;

  Register({this.message, this.errors});

  Register.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors = json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? name;
  List<String>? email;
  List<String>? password;

  Errors({this.name, this.email, this.password});

  Errors.fromJson(Map<String, dynamic> json) {
    name = json['name']==null?[]:List<String>.from(json['name']);
    email = json['email']==null?[]:List<String>.from(json['email']);
    password = json['password']==null?[]:List<String>.from(json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
