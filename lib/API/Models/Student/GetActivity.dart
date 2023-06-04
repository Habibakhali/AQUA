class GetActivity {
  bool? success;
  List<PayloadActivity>? payload;

  GetActivity({this.success, this.payload});

  GetActivity.fromJson(Map<String, dynamic> json) {
    success = json['success'];
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
  String? name;
  String? email;

  PayloadActivity(
      {this.id,
        this.title,
        this.des,
        this.image,
        this.createdAt,
        this.stdId,
        this.name,
        this.email});

  PayloadActivity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    des = json['des'];
    image = json['image'];
    createdAt = json['created_at'];
    stdId = json['std_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['des'] = this.des;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['std_id'] = this.stdId;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
