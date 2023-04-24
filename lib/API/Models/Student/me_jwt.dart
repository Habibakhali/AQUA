class MeJWT {
  String? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  Null? stdInfo;
  String? createdAt;
  String? updatedAt;
  String? message;

  MeJWT(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.stdInfo,
        this.createdAt,
        this.updatedAt,
        this.message});

  MeJWT.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    stdInfo = json['std_info'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['std_info'] = this.stdInfo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['message'] = this.message;
    return data;
  }
}
