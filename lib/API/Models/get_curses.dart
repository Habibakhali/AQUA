class GetCourses {
  String? message;
  bool? success;
  List<Payloadd>? payload;

  GetCourses({this.message, this.success, this.payload});

  GetCourses.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['payload'] != null) {
      payload = <Payloadd>[];
      json['payload'].forEach((v) {
        payload!.add(new Payloadd.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.payload != null) {
      data['payload'] = this.payload!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payloadd {
  String? cCode;
  String? cName;
  int? cHours;
  List<String>? cPrereq;
  int? semester;

  Payloadd({this.cCode, this.cName, this.cHours, this.cPrereq, this.semester});

  Payloadd.fromJson(Map<String, dynamic> json) {
    cCode = json['c_code'];
    cName = json['c_name'];
    cHours = json['c_hours'];
    cPrereq = json['c_prereq']==null?[]:List.from(json['c_prereq']);
    semester = json['semester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c_code'] = this.cCode;
    data['c_name'] = this.cName;
    data['c_hours'] = this.cHours;
    data['c_prereq'] = this.cPrereq;
    data['semester'] = this.semester;
    return data;
  }
}
