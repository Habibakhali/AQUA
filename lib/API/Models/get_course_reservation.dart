class GetCourseReservation {
  bool? success;
  String? message;
  List<PayloadcourseReservation>? payload;

  GetCourseReservation({this.success, this.message, this.payload});

  GetCourseReservation.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <PayloadcourseReservation>[];
      json['payload'].forEach((v) {
        payload!.add(new PayloadcourseReservation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.payload != null) {
      data['payload'] = this.payload!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PayloadcourseReservation {
  int? id;
  String? stdId;
  String? cCode;
  int? semester;
  String? createdAt;

  PayloadcourseReservation({this.id, this.stdId, this.cCode, this.semester, this.createdAt});

  PayloadcourseReservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stdId = json['std_id'];
    cCode = json['c_code'];
    semester = json['semester'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['std_id'] = this.stdId;
    data['c_code'] = this.cCode;
    data['semester'] = this.semester;
    data['created_at'] = this.createdAt;
    return data;
  }
}
