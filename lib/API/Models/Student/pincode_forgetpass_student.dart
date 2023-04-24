//ده علشان يبعت مسدج للايميل اللي كتبته ولاقاه عندي
class PincodeToForgertPStudent {
  String? message;
  Errors? errors;

  PincodeToForgertPStudent({this.message, this.errors});

  PincodeToForgertPStudent.fromJson(Map<String, dynamic> json) {
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

  Errors({this.pincode});

  Errors.fromJson(Map<String, dynamic> json) {
    pincode = json['pincode']==null?[]:List<String>.from(json['pincode']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pincode'] = this.pincode;
    return data;
  }
}
