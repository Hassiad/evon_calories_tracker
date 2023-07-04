class ForgotPassword {
  String? status;
  String? message;

  ForgotPassword({required this.status, required this.message});

  ForgotPassword.fromJson(Map<String, dynamic> json) {
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

class ResetPassword {
  String? status;
  String? token;
  String? message;
  Data? data;

  ResetPassword({this.status, this.token, this.message, required this.data});

  ResetPassword.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  // String? bankVerificationNumber;
  // String? balance;
  String? sId;
  String? level;
  String? role;
  String? photo;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  // String? address;
  // String? otpConfirmationCode;
  // String? residentialState;
  // String? residentialAddress;
  // String? nextOfKin;
  // int? iV;
  // bool? isPaid;
  // String? updatedAt;
  // String? nextPaymentDate;

  Data({
    // this.bankVerificationNumber,
    // this.balance,
    this.sId,
    this.level,
    this.role,
    this.photo,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    // this.address,
    // this.otpConfirmationCode,
    // this.residentialState,
    // this.residentialAddress,
    // this.nextOfKin,
    // this.iV,
    // this.isPaid,
    // this.updatedAt,
    // this.nextPaymentDate
  });

  Data.fromJson(Map<String, dynamic> json) {
    // bankVerificationNumber = json['bankVerificationNumber'];
    // balance = json['balance'];
    sId = json['_id'];
    level = json['level'];
    role = json['role'];
    photo = json['photo'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    // address = json['address'];
    // otpConfirmationCode = json['otpConfirmationCode'];
    // residentialState = json['residentialState'];
    // residentialAddress = json['residentialAddress'];
    // nextOfKin = json['nextOfKin'];
    // iV = json['__v'];
    // isPaid = json['is_paid'];
    // updatedAt = json['updatedAt'];
    // nextPaymentDate = json['next_payment_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['bankVerificationNumber'] = this.bankVerificationNumber;
    // data['balance'] = this.balance;
    data['_id'] = this.sId;
    data['level'] = this.level;
    data['role'] = this.role;
    data['photo'] = this.photo;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    // data['address'] = this.address;
    // data['otpConfirmationCode'] = this.otpConfirmationCode;
    // data['residentialState'] = this.residentialState;
    // data['residentialAddress'] = this.residentialAddress;
    // data['nextOfKin'] = this.nextOfKin;
    // data['__v'] = this.iV;
    // data['is_paid'] = this.isPaid;
    // data['updatedAt'] = this.updatedAt;
    // data['next_payment_date'] = this.nextPaymentDate;
    return data;
  }
}
