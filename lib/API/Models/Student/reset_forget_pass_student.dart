class ResetForgetPassStudent {
  String? message;
  Errors? errors;

  ResetForgetPassStudent({this.message, this.errors});

  ResetForgetPassStudent.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
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
  List<String>? pincode;
  List<String>? password;

  Errors({this.pincode, this.password});

  Errors.fromJson(Map<String, dynamic> json) {
    pincode = json['pincode']==null?[]:List<String>.from(json['pincode']);
    password = json['password']==null?[]:List<String>.from(json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pincode'] = this.pincode;
    data['password'] = this.password;
    return data;
  }
}
