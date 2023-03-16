class UserError {
  String? status;
  String? message;

  UserError({this.status, this.message});

  UserError.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
