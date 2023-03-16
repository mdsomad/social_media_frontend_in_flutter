class GetUserDataModel {
  User? user;

  GetUserDataModel({this.user});

  GetUserDataModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  int? phone;
  int? age;
  bool? tc;
  String? date;
  int? iV;

  User(
      {this.sId,
      this.name,
      this.email,
      this.phone,
      this.age,
      this.tc,
      this.date,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    age = json['age'];
    tc = json['tc'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['age'] = this.age;
    data['tc'] = this.tc;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
