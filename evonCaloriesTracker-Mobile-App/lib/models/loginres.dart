class loginres {
  String? status;
  String? token;
  String? message;
  Data? data;

  loginres({this.status, this.token, this.message, this.data});

  loginres.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    return data;
  }
}

class User {
  String? level;
  String? role;
  // String? photo;
  String? sId;
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

  User({
    this.level,
    this.role,
    // this.photo,
    this.sId,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    // this.address,
    // this.otpConfirmationCode,
    // this.residentialState,
    // this.residentialAddress,
    // this.nextOfKin,
    // this.iV
  });

  User.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    role = json['role'];
    // photo = json['photo'];
    sId = json['id'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['role'] = this.role;
    // data['photo'] = this.photo;
    data['id'] = this.sId;
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
    return data;
  }
}
