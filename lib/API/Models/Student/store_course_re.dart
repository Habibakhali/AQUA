class StoreCourseReservation {
  bool? success;
  Payload? payload;
  String? message;
  Errors? errors;

  StoreCourseReservation(
      {this.success, this.payload, this.message, this.errors});

  StoreCourseReservation.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    payload =
    json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    message = json['message'];
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Payload {
  String? cCode;
  int? semester;
  String? stdId;
  int? id;

  Payload({this.cCode, this.semester, this.stdId, this.id});

  Payload.fromJson(Map<String, dynamic> json) {
    cCode = json['c_code'];
    semester = json['semester'];
    stdId = json['std_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c_code'] = this.cCode;
    data['semester'] = this.semester;
    data['std_id'] = this.stdId;
    data['id'] = this.id;
    return data;
  }
}

class Errors {
  List<String>? cCode;
  List<String>? semester;

  Errors({this.cCode, this.semester});

  Errors.fromJson(Map<String, dynamic> json) {
    cCode = json['c_code']==null?[]:List.from(json['c_code']);
    semester = json['semester']==null?[]:List.from(json['semester']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c_code'] = this.cCode;
    data['semester'] = this.semester;
    return data;
  }
}
