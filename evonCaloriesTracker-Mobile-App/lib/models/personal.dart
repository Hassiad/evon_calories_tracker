class persond {
  String? firstName;
  String? lastName;
  String? token;
  String? email;

  persond({this.firstName, this.lastName, this.token, this.email});

  persond.fromJson(Map<String, dynamic> json) {
    firstName = json['firstname'];
    lastName = json['lastname'];
    token = json['token'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstName;
    data['lastname'] = this.lastName;
    data['token'] = this.token;
    data['email'] = this.email;
    return data;
  }
}
