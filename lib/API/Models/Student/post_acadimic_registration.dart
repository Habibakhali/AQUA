class PostAcademicRegistryApi {
  String? message;
  Errors? errors;
  bool? success;
  Payload? payload;

  PostAcademicRegistryApi({this.message, this.errors, this.success, this.payload});

  PostAcademicRegistryApi.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
    success = json['success'];
    payload =
    json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    data['success'] = this.success;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? image;
  List<String>? semester;

  Errors({this.image, this.semester});

  Errors.fromJson(Map<String, dynamic> json) {
    image = json['image']==null?[]:List.from(json['image']);
    semester = json['semester']==null?[]:List.from(json['semester']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['semester'] = this.semester;
    return data;
  }
}

class Payload {
  String? image;
  String? semester;
  String? stdId;
  int? id;

  Payload({this.image, this.semester, this.stdId, this.id});

  Payload.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    semester = json['semester'];
    stdId = json['std_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['semester'] = this.semester;
    data['std_id'] = this.stdId;
    data['id'] = this.id;
    return data;
  }
}
