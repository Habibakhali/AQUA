class GetActivity {
  bool? success;
  String? message;
  List<PayloadActivity>? payload;

  GetActivity({this.success, this.message, this.payload});

  GetActivity.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <PayloadActivity>[];
      json['payload'].forEach((v) {
        payload!.add(new PayloadActivity.fromJson(v));
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

class PayloadActivity {
  int? id;
  String? title;
  String? des;
  String? image;
  String? createdAt;
  String? stdId;

  PayloadActivity(
      {this.id, this.title, this.des, this.image, this.createdAt, this.stdId});

  PayloadActivity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    des = json['des'];
    image = json['image'];
    createdAt = json['created_at'];
    stdId = json['std_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['des'] = this.des;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['std_id'] = this.stdId;
    return data;
  }
}
