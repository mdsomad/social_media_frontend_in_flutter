class UserModel {
  bool? status;
  String? message;
  String? userid;
  String? token;

  UserModel({this.status, this.message, this.userid, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userid = json['userid'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['userid'] = this.userid;
    data['token'] = this.token;
    return data;
  }
}
