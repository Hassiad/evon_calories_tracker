class PassedData {
  String? token;
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? accountId;
  String? role;
  String? level;
  bool? telewebSub;
  bool? handymanSub;
  bool? isPaid;
  bool? nextPaymentDate;
  String? status;
  bool? active;
  String? kycVerified;
  String? profileImageURL;
  String? registeredAt;
  String? residentialState;
  String? residentialAddress;
  String? nextOfKin;
  String? bvn;
  String? otp;
  String? secureId;
  String? answer;
  String? identityTypeId;
  String? identityNumber;
  String? identityIssueDate;
  String? identityExpiryDate;
  String? identityImageFront;
  String? identityImageBack;
  String? balance;
  String? updatedAt;
  int? iV;

  PassedData({
    this.token,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.accountId,
    this.role,
    this.level,
    this.telewebSub,
    this.handymanSub,
    this.isPaid,
    this.nextPaymentDate,
    this.status,
    this.active,
    this.kycVerified,
    this.profileImageURL,
    this.registeredAt,
    this.residentialState,
    this.residentialAddress,
    this.nextOfKin,
    this.bvn,
    this.otp,
    this.secureId,
    this.answer,
    this.identityTypeId,
    this.identityNumber,
    this.identityIssueDate,
    this.identityExpiryDate,
    this.identityImageFront,
    this.identityImageBack,
    this.balance,
    this.updatedAt,
    this.iV,
  });

  PassedData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    accountId = json['accountId'];
    role = json['role'];
    level = json['level'];
    telewebSub = json['telewebSub'];
    handymanSub = json['handymanSub'];
    isPaid = json['isPaid'];
    nextPaymentDate = json['nextPaymentDate'];
    status = json['status'];
    active = json['active'];
    kycVerified = json['kycVerified'];
    profileImageURL = json['profileImageURL'];
    registeredAt = json['registeredAt'];
    residentialState = json['residentialState'];
    residentialAddress = json['residentialAddress'];
    nextOfKin = json['nextOfKin'];
    bvn = json['bvn'];
    otp = json['otp'];
    secureId = json['secureId'];
    answer = json['answer'];
    identityTypeId = json['identityTypeId'];
    identityNumber = json['identityNumber'];
    identityIssueDate = json['identityIssueDate'];
    identityExpiryDate = json['identityExpiryDate'];
    identityImageFront = json['identityImageFront'];
    identityImageBack = json['identityImageBack'];
    balance = json['balance'];
    updatedAt = json['updatedAt'];
    iV = json['iV'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['accountId'] = accountId;
    data['role'] = role;
    data['level'] = level;
    data['telewebSub'] = telewebSub;
    data['handymanSub'] = handymanSub;
    data['isPaid'] = isPaid;
    data['nextPaymentDate'] = nextPaymentDate;
    data['status'] = status;
    data['active'] = active;
    data['kycVerified'] = kycVerified;
    data['profileImageURL'] = profileImageURL;
    data['registeredAt'] = registeredAt;
    data['residentialState'] = residentialState;
    data['residentialAddress'] = residentialAddress;
    data['nextOfKin'] = nextOfKin;
    data['bvn'] = bvn;
    data['otp'] = otp;
    data['secureId'] = secureId;
    data['answer'] = answer;
    data['identityTypeId'] = identityTypeId;
    data['identityNumber'] = identityNumber;
    data['identityIssueDate'] = identityIssueDate;
    data['identityExpiryDate'] = identityExpiryDate;
    data['identityImageFront'] = identityImageFront;
    data['identityImageBack'] = identityImageBack;
    data['balance'] = balance;
    data['updatedAt'] = updatedAt;
    data['iV'] = iV;
    return data;
  }
}
