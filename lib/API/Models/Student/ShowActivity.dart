class ShowActivity {
  bool? success;
  Payload? payload;

  ShowActivity({this.success, this.payload});

  ShowActivity.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    payload =
    json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    return data;
  }
}

class Payload {
  int? id;
  String? title;
  String? des;
  String? image;
  String? createdAt;
  String? stdId;

  Payload(
      {this.id, this.title, this.des, this.image, this.createdAt, this.stdId});

  Payload.fromJson(Map<String, dynamic> json) {
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
