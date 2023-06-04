/*
class Details {
  String? message;
  Errors? errors;
  bool? success;
  Payload? payload;

 Details({this.success, this.payload,this.message, this.errors});


  Details .fromJson(Map<String, dynamic> json) {
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
  String? dob;
  String? phone;
  String? address;
  String? gradBatch;
  String? department;
  String? specialization;
  String? scientificDegree;
  String? academicCertificates;
  String? graduationCertificate;
  String? academicRecord;
  String? gpa;
  String? cv;
  String? courses;
  String? awards;
  String? gradId;
  int? id;

  Payload(
      {this.dob,
        this.phone,
        this.address,
        this.gradBatch,
        this.department,
        this.specialization,
        this.scientificDegree,
        this.academicCertificates,
        this.graduationCertificate,
        this.academicRecord,
        this.gpa,
        this.cv,
        this.courses,
        this.awards,
        this.gradId,
        this.id});
  Payload.fromJson(Map<String, dynamic> json) {
    dob = json['dob'];
    phone = json['phone'];
    address = json['address'];
    gradBatch = json['grad_batch'];
    department = json['department'];
    specialization = json['specialization'];
    scientificDegree = json['scientific_degree'];
    academicCertificates = json['academic_certificates'];
    graduationCertificate = json['graduation_certificate'];
    academicRecord = json['academic_record'];
    gpa = json['gpa'];
    cv = json['cv'];
    courses = json['courses'];
    awards = json['awards'];
    gradId = json['grad_id'];
    id = json['id'];
  }}

class Errors {
  List<String>? phone;
  List<String>? image;
  List<String>? academicCertificates;
  List<String>? graduationCertificate;
  List<String>? academicRecord;
  List<String>? cv;
  List<String>? courses;
  List<String>? awards;

  Errors(
      {this.phone,
        this.image,
        this.academicCertificates,
        this.graduationCertificate,
        this.academicRecord,
        this.cv,
        this.courses,
        this.awards});

  Errors.fromJson(Map<String, dynamic> json) {
    phone = json['phone'].cast<String>();
    image = json['image'].cast<String>();
    academicCertificates = json['academic_certificates'].cast<String>();
    graduationCertificate = json['graduation_certificate'].cast<String>();
    academicRecord = json['academic_record'].cast<String>();
    cv = json['cv'].cast<String>();
    courses = json['courses'].cast<String>();
    awards = json['awards'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['academic_certificates'] = this.academicCertificates;
    data['graduation_certificate'] = this.graduationCertificate;
    data['academic_record'] = this.academicRecord;
    data['cv'] = this.cv;
    data['courses'] = this.courses;
    data['awards'] = this.awards;
    return data;
  }

}
*/