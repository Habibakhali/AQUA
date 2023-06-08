
class Details {
  String? message;
  Errors? errors;
  bool? success;
  Payload? payload;

 Details({this.success, this.payload});


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
  String? image;
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
        this.image,
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
    image = json['image'];
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
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['image'] = this.image;
    data['grad_batch'] = this.gradBatch;
    data['department'] = this.department;
    data['specialization'] = this.specialization;
    data['scientific_degree'] = this.scientificDegree;
    data['academic_certificates'] = this.academicCertificates;
    data['graduation_certificate'] = this.graduationCertificate;
    data['academic_record'] = this.academicRecord;
    data['gpa'] = this.gpa;
    data['cv'] = this.cv;
    data['courses'] = this.courses;
    data['awards'] = this.awards;
    data['grad_id'] = this.gradId;
    data['id'] = this.id;
    return data;
  }
}

class Errors {
  List<String>? dob;
  List<String>? phone;
  List<String>? address;
  List<String>? gradBatch;
  List<String>? department;
  List<String>? specialization;
  List<String>? scientificDegree;
  List<String>? academicCertificates;
  List<String>? graduationCertificate;
  List<String>? academicRecord;
  List<String>? gpa;
  List<String>? cv;
  List<String>? courses;

  Errors(
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
        this.courses});

  Errors.fromJson(Map<String, dynamic> json) {
    dob = json['dob'].cast<String>();
    phone = json['phone'].cast<String>();
    address = json['address'].cast<String>();
    gradBatch = json['grad_batch'].cast<String>();
    department = json['department'].cast<String>();
    specialization = json['specialization'].cast<String>();
    scientificDegree = json['scientific_degree'].cast<String>();
    academicCertificates = json['academic_certificates'].cast<String>();
    graduationCertificate = json['graduation_certificate'].cast<String>();
    academicRecord = json['academic_record'].cast<String>();
    gpa = json['gpa'].cast<String>();
    cv = json['cv'].cast<String>();
    courses = json['courses'].cast<String>();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['grad_batch'] = this.gradBatch;
    data['department'] = this.department;
    data['specialization'] = this.specialization;
    data['scientific_degree'] = this.scientificDegree;
    data['academic_certificates'] = this.academicCertificates;
    data['graduation_certificate'] = this.graduationCertificate;
    data['academic_record'] = this.academicRecord;
    data['gpa'] = this.gpa;
    data['cv'] = this.cv;
    data['courses'] = this.courses;
    return data;
  }

}
