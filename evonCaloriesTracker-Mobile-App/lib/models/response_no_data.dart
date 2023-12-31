class ResponseWithNoData {
  String? status;
  String? message;

  ResponseWithNoData({required this.status, required this.message});

  ResponseWithNoData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
