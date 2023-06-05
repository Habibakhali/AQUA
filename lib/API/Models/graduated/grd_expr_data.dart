class getGrdExp {
  bool? success;
  List<Payload>? payload;

  getGrdExp({this.success, this.payload});

  getGrdExp.fromJson(Map<String, dynamic> json) {
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
  String? jobTitle;
  String? startDate;
  String? endDate;
  String? gradId;
  int? companyId;

  Payload(
      {this.id,
        this.jobTitle,
        this.startDate,
        this.endDate,
        this.gradId,
        this.companyId});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTitle = json['job_title'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    gradId = json['grad_id'];
    companyId = json['company_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_title'] = this.jobTitle;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['grad_id'] = this.gradId;
    data['company_id'] = this.companyId;
    return data;
  }
}
