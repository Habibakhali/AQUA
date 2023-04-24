class LoginStudentApi {
  String? accessToken;
  String? message;
  String? tokenType;
  User? user;
  int? expiresIn;
  String? error;

  LoginStudentApi(
      {this.accessToken,
        this.message,
        this.tokenType,
        this.user,
        this.expiresIn,
        this.error});

  LoginStudentApi.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    message = json['message'];
    tokenType = json['token_type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    expiresIn = json['expires_in'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['message'] = this.message;
    data['token_type'] = this.tokenType;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['expires_in'] = this.expiresIn;
    data['error'] = this.error;
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  Null? stdInfo;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.stdInfo,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    stdInfo = json['std_info'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}
