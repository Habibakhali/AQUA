class GetRegisterationFormModel {
  bool? success;
  String? message;
  Payload? payload;

  GetRegisterationFormModel({this.success, this.message, this.payload});

  GetRegisterationFormModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    payload =
    json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
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

class Payload {
  int? id;
  String? reImage;
  String? daImage;
  int? semester;
  String? stdId;

  Payload({this.id, this.reImage, this.daImage, this.semester, this.stdId});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reImage = json['re_image'];
    daImage = json['da_image'];
    semester = json['semester'];
    stdId = json['std_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['re_image'] = this.reImage;
    data['da_image'] = this.daImage;
    data['semester'] = this.semester;
    data['std_id'] = this.stdId;
    return data;
  }
}
