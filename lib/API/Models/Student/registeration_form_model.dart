class RegisterationFormModel {
  bool? success;
  Payload? payload;
  String? message;
  Errors? errors;

  RegisterationFormModel(
      {this.success, this.payload, this.message, this.errors});

  RegisterationFormModel.fromJson(Map<String, dynamic> json) {
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
  String? reImage;
  String? semester;
  String? stdId;
  int? id;

  Payload({this.reImage, this.semester, this.stdId, this.id});

  Payload.fromJson(Map<String, dynamic> json) {
    reImage = json['re_image'];
    semester = json['semester'];
    stdId = json['std_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['re_image'] = this.reImage;
    data['semester'] = this.semester;
    data['std_id'] = this.stdId;
    data['id'] = this.id;
    return data;
  }
}

class Errors {
  List<String>? reImage;
  List<String>? semester;

  Errors({this.reImage, this.semester});

  Errors.fromJson(Map<String, dynamic> json) {
    reImage = json['re_image']==null?[]:List.from(json['re_image']);
    semester = json['semester']==null?[]:List.from(json['semester']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['re_image'] = this.reImage;
    data['semester'] = this.semester;
    return data;
  }
}
