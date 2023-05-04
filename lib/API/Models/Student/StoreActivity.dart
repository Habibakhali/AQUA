class StoreActivity {
  String? message;
  Errors? errors;

  StoreActivity({this.message, this.errors});

  StoreActivity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? title;
  List<String>? des;
  List<String>? image;

  Errors({this.title, this.des, this.image});

  Errors.fromJson(Map<String, dynamic> json) {
    title = json['title']==null?[]:List.from(json['des']);
    des = json['des']==null?[]:List.from(json['des']);
    image = json['image']==null?[]:List.from(json['image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['des'] = this.des;
    data['image'] = this.image;
    return data;
  }
}
