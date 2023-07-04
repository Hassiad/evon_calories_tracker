class UserResponseWithNoData {
  String? status;
  String? data;

  UserResponseWithNoData({this.status, this.data});

  UserResponseWithNoData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = data;
    return data;
  }
}
