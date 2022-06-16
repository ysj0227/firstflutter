class user {
  int? code;
  Data? data;
  bool? success;

  user({this.code, this.data, this.success});

  user.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = success;
    return data;
  }
}

class Data {
  String? avatar;
  int? studentId;
  String? bindPhone;

  Data({this.avatar, this.studentId,  this.bindPhone});

  Data.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    studentId = json['student_id'];
    bindPhone = json['bind_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['student_id'] = studentId;
    data['bind_phone'] = bindPhone;
    return data;
  }
}
