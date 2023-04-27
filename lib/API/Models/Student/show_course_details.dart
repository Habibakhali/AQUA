class ShowCourseDetails {
  bool? success;
  String? message;
  PayloadShowCourses? payload;

  ShowCourseDetails({this.success, this.message, this.payload});

  ShowCourseDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    payload =
    json['payload'] != null ? new PayloadShowCourses.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    return data;
  }
}

class PayloadShowCourses {
  String? cCode;
  String? cName;
  int? cHours;
  List<String>? cPrereq;
  int? semester;

  PayloadShowCourses({this.cCode, this.cName, this.cHours, this.cPrereq, this.semester});

  PayloadShowCourses.fromJson(Map<String, dynamic> json) {
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
